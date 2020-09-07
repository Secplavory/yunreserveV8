#include "controller.h"

controller::controller()
{
    connect(restartTimer, &QTimer::timeout, this, &controller::restartTimer_signal);
    connect(checkDoorTimer, &QTimer::timeout, this, &controller::checkDoorTimer_signal);
    connect(snapShotTimer, &QTimer::timeout, this, &controller::snapShot);
    snapShotTimer->start(1800000);
    snapShot();
}
void controller::to_page(QString source){
    setPageSource(source);
}
void controller::setFunction(QString handler){
    functionHandler = handler;
}
void controller::setRestartTimer(QString handler){
    if(handler == "1"){
        restartTimer->start(40000);
    }else
    if(handler == "0"){
        restartTimer->stop();
    }else{
        restartTimer->start(handler.toUInt());
    }
}
void controller::getMemberQrcode(QString handler){
    setPageState("0");
    QString result = db->member_qrcode(handler);
    if(result=="-99"){
        pageSource_url = "Welcome";
        setDisconnected_warning("1");
    }else{
        qrcode_url_text = result;
        emit qrcode_urlChanged();
        pageSource_url = "Member";
    }
    if(handler=="1"){
        member_title_text = "請掃描條碼註冊會員";
    }else
    if(handler=="2"){
        member_title_text = "請掃描條碼更改會員資訊";
    }else
    if(handler=="3"){
        member_title_text = "請掃描條碼重設會員密碼";
    }
    emit member_titleChanged();
    QEventLoop loop;
    QTimer::singleShot(400,&loop,SLOT(quit()));
    loop.exec();
    emit pageSourceChanged();
    setPageState("1");
}
void controller::getContractQrcode(){
    setPageState("0");
    QString result = db->getContractQrcode();
    if(result=="-99"){
        pageSource_url = "Welcome";
        setDisconnected_warning("1");
    }else{
        qrcode_url_text = result;
        emit qrcode_urlChanged();
        pageSource_url = "Contract";
    }
    QEventLoop loop;
    QTimer::singleShot(400,&loop,SLOT(quit()));
    loop.exec();
    emit pageSourceChanged();
    setPageState("1");
}
void controller::setChannelState(){
    setPageState("0");
    QEventLoop loop;
    QTimer::singleShot(500,&loop,SLOT(quit()));
    loop.exec();
    if(functionHandler=="1"){
        QString result = db->getChannelStatus();
        if(result=="-99"){
            setDisconnected_warning("1");
            pageSource_url = "Welcome";
            emit pageSourceChanged();
            setPageState("1");
            return;
        }
        QJsonDocument jsonDocument = QJsonDocument::fromJson(result.toUtf8());
        for(int i=0; i<28; i++){
            if(jsonDocument[i]["product_id"].toInt()==0){
                channelStates[i] = "0";
            }else{
                channelStates[i] = "1";
            }
        }
    }else
    if(functionHandler=="2"){
        QString result = db->getChannelStatus();
        if(result=="-99"){
            setDisconnected_warning("1");
            pageSource_url = "Welcome";
            emit pageSourceChanged();
            setPageState("1");
            return;
        }
        QJsonDocument jsonDocument = QJsonDocument::fromJson(result.toUtf8());
        for(int i=0; i<28; i++){
            if(jsonDocument[i]["product_id"].toInt()==0){
                channelStates[i] = "1";
            }else{
                channelStates[i] = "0";
            }
        }
    }else
    if(functionHandler=="3"){
        QString result = db->getChannelOwn(member_id);
        if(result=="-99"){
            setDisconnected_warning("1");
            pageSource_url = "Welcome";
            emit pageSourceChanged();
            setPageState("1");
            return;
        }
        QJsonDocument jsonDocument = QJsonDocument::fromJson(result.toUtf8());
        for(int i=0;i<28;i++){
            channelStates[i] = "0";
        }
        QJsonArray jsonArray = jsonDocument.array();
        for(int i=0;i<jsonArray.size();i++){
            channelStates[jsonArray[i].toInt()-1] = "1";
        }
    }else
    if(functionHandler=="99"){
        for(int i=0;i<28;i++){
            channelStates[i] = "1";
        }
    }
    emit channelChanged();
    pageSource_url = "ChooseChannel";
    emit pageSourceChanged();
    setPageState("1");
}

void controller::channelClicked(QString channelId){
    setPageState("2");
    channel_id = channelId;
    if(functionHandler=="1"){
        QString result = db->getProductInfo(channel_id);
        if(result=="-99"){
            setDisconnected_warning("1");
            setPageSource("Welcome");
        }
        QJsonDocument jsonDocument = QJsonDocument::fromJson(result.toUtf8());
        productInfo_name_text = jsonDocument["product_name"].toString();
        QString product_price = QString::number(jsonDocument["product_price"].toInt());
        productInfo_price_text = product_price;
        QString product_id = QString::number(jsonDocument["id"].toInt());
        QRcode_orderNumber = QString("%1").arg(product_id.toInt()%1000000, 6,10,QLatin1Char('0'));
        emit productInfoChanged();
        taiwanPay_QRcode_text = "TWQRP://藏藝點/158/01/V1?D1="+product_price+"00&D2="+QRcode_orderNumber+"&D3=AeHoYzwSULbZ&D10=901&D11=00,00400482497653500150010001;01,00400482497653500150010001";
        emit taiwanPay_QRcodeChanged();
        setPageSource("Perchase");
    }else
    if(functionHandler=="2"){
        setPageSource("Upload");
    }else
    if(functionHandler=="3"){
        QString result = db->getProductInfo(channel_id);
        if(result=="-99"){
            setDisconnected_warning("1");
            setPageSource("Welcome");
        }
        QJsonDocument jsonDocument = QJsonDocument::fromJson(result.toUtf8());
        productInfo_name_text = jsonDocument["product_name"].toString();
        QString product_price = QString::number(jsonDocument["product_price"].toInt());
        productInfo_price_text = product_price;
        emit productInfoChanged();
        setPageSource("Recall");
    }else
    if(functionHandler=="99"){
        mc->openDoor(channel_id);
        setPageState("1");
    }
}
QString controller::upload_submit(QString productName, QString productPrice){
    setPageState("2");
    QRegularExpression re_item("^[\u4e00-\u9fa5a-zA-Z0-9]{1,20}$", QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match_item = re_item.match(productName);
    if(!match_item.hasMatch()){
        setPageState("1");
        return "-1";
    }
    QRegularExpression re_price("^[1-9][0-9]{1,4}$", QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch match_price = re_price.match(productPrice);
    if(!match_price.hasMatch()){
        setPageState("1");
        return "-2";
    }
    QString result = db->upload_submit(productName, productPrice, channel_id, member_id);
    if(result=="-99"){
        setDisconnected_warning("1");
        setPageSource("Welcome");
        return "-99";
    }else
    if(result=="1"){
        mc->openDoor(channel_id);
        setPageSource("CloseChannel");
        checkDoorTimer->start(2000);
        restartTimer->stop();
        return "1";
    }else{
        setPageState("1");
        return "0";
    }
}

QString controller::login_submit(QString acc, QString pwd){
    setPageState("2");
    QRegularExpression r_acc("^\\w{6,18}$", QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch m_acc = r_acc.match(acc);
    if(!m_acc.hasMatch()){
        setPageState("1");
        return "-1";
    }
    QRegularExpression r_pwd("^\\w{6,12}$", QRegularExpression::CaseInsensitiveOption);
    QRegularExpressionMatch m_pwd = r_pwd.match(pwd);
    if(!m_pwd.hasMatch()){
        setPageState("1");
        return "-2";
    }
    QString result = db->login_submit(acc, pwd);
    if(result=="-99"){
        setDisconnected_warning("1");
        setPageSource("Welcome");
    }else
    if(result=="0"){
        setPageState("1");
    }else{
        member_id = result;
        setChannelState();
    }
    return result;
}
QString controller::check_taiwanPay(){
    setPageState("2");
    QString result = db->check_taiwanPay(QRcode_orderNumber, productInfo_price_text, channel_id);
    if(result=="-99"){
        setDisconnected_warning("1");
        setPageSource("Welcome");
        return "-99";
    }else
    if(result=="false"){
        setPageState("1");
        return "0";
    }else
    if(result=="true"){
        mc->openDoor(channel_id);
        setPageSource("CloseChannel");
        checkDoorTimer->start(2000);
        restartTimer->stop();
        return "1";
    }else{
        setDisconnected_warning("1");
        setPageSource("Welcome");
        return "-99";
    }
}

void controller::recall_submit(){
    setPageState("2");
    QString result = db->recall_submit(channel_id);
    if(result=="true"){
        mc->openDoor(channel_id);
        setPageSource("CloseChannel");
        checkDoorTimer->start(2000);
        restartTimer->stop();
    }else{
        setPageSource("Welcome");
    }
}

QString controller::linePay_submit(QString oneTimeKey){
    setPageState("2");
    QString result = db->linePay_submit(channel_id, oneTimeKey);
    if(result=="-99"){
        setDisconnected_warning("1");
        setPageSource("Welcome");
        return "-99";
    }else
    if(result=="0000"){
        mc->openDoor(channel_id);
        setPageSource("CloseChannel");
        checkDoorTimer->start(2000);
        restartTimer->stop();
        return "1";
    }else{
        setPageState("1");
        return "0";
    }
}
void controller::setDisconnected_warning(QString state){
    disconnected_warning_state = state;
    emit disconnected_warningChanged();
}

void controller::admin_management(){
    setPageState("2");
    QString result = db->admin_management();
    if(result == "1"){
        setFunction("99");
        setChannelState();
    }else{
        setPageState("1");
    }
}
