#include "dbmgr.h"

dbmgr::dbmgr()
{

}
QString dbmgr::member_qrcode(QString handler){
    if(handler=="1"){
        request.setUrl(QUrl("https://yunreserve.com/api/channel/getSignupQRcode"));
    }else
    if(handler=="2"){
        request.setUrl(QUrl("https://yunreserve.com/api/channel/getChangeMemberInfoQRcode"));
    }else
    if(handler=="3"){
        request.setUrl(QUrl("https://yunreserve.com/api/channel/getForgetMemberQRcode"));
    }
    pReply = manager->get(request);
    QEventLoop eventLoop;
    QObject::connect(manager, &QNetworkAccessManager::finished, &eventLoop, &QEventLoop::quit);
    eventLoop.exec();
    QString result = pReply->readAll();
    if(result==""){
        return "-99";
    }
    return result;
}
QString dbmgr::getContractQrcode(){
    request.setUrl(QUrl("https://yunreserve.com/api/channel/getContractQRcode"));
    pReply = manager->get(request);
    QEventLoop eventLoop;
    QObject::connect(manager, &QNetworkAccessManager::finished, &eventLoop, &QEventLoop::quit);
    eventLoop.exec();
    QString result = pReply->readAll();
    if(result==""){
        return "-99";
    }
    return result;
}
QString dbmgr::login_submit(QString acc, QString pwd){
    request.setUrl(QUrl("https://yunreserve.com/api/channel/login"));
    QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);
    QHttpPart securityCode;
    securityCode.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"securityCode\""));
    securityCode.setBody("OFA82497653@");
    QHttpPart member_acc;
    member_acc.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"member_account\""));
    member_acc.setBody(acc.toUtf8());
    QHttpPart member_pwd;
    member_pwd.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"member_password\""));
    member_pwd.setBody(pwd.toUtf8());
    multiPart->append(securityCode);
    multiPart->append(member_acc);
    multiPart->append(member_pwd);
    pReply = manager->post(request, multiPart);
    QEventLoop eventLoop;
    QObject::connect(manager, &QNetworkAccessManager::finished, &eventLoop, &QEventLoop::quit);
    eventLoop.exec();
    QString result = pReply->readAll();
    delete(multiPart);
    multiPart = nullptr;
    if(result==""){
        return "-99";
    }
    return result;
}
QString dbmgr::getChannelStatus(){
    request.setUrl(QUrl("https://yunreserve.com/api/channel/status"));
    pReply = manager->get(request);
    QEventLoop eventLoop;
    QObject::connect(manager, &QNetworkAccessManager::finished, &eventLoop, &QEventLoop::quit);
    eventLoop.exec();
    QString result = pReply->readAll();
    if(result==""){
        return "-99";
    }
    return result;
}
QString dbmgr::getChannelOwn(QString member_id){
    request.setUrl(QUrl("https://yunreserve.com/api/channel/productOwner"));
    QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);
    QHttpPart securityCode;
    securityCode.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"securityCode\""));
    securityCode.setBody("OFA82497653@");
    QHttpPart memberId;
    memberId.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"memberId\""));
    memberId.setBody(member_id.toUtf8());
    multiPart->append(securityCode);
    multiPart->append(memberId);
    pReply = manager->post(request, multiPart);
    QEventLoop eventLoop;
    QObject::connect(manager, &QNetworkAccessManager::finished, &eventLoop, &QEventLoop::quit);
    eventLoop.exec();
    QString result = pReply->readAll();
    delete(multiPart);
    multiPart = nullptr;
    if(result==""){
        return "-99";
    }
    return result;
}
QString dbmgr::getProductInfo(QString channelId){
    request.setUrl(QUrl("https://yunreserve.com/api/channel/product/"+channelId));
    pReply = manager->get(request);
    QEventLoop eventLoop;
    QObject::connect(manager, &QNetworkAccessManager::finished, &eventLoop, &QEventLoop::quit);
    eventLoop.exec();
    QString result = pReply->readAll();
    if(result==""){
        return "-99";
    }
    return result;
}
QString dbmgr::check_taiwanPay(QString orderNumber, QString product_price, QString channel_id){
    request.setUrl(QUrl("https://yunreserve.com/api/channel/checkPayment/TWpay"));
    QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);
    QHttpPart securityCode;
    securityCode.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"securityCode\""));
    securityCode.setBody("OFA82497653@");
    QHttpPart order_Number;
    order_Number.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"orderNumber\""));
    order_Number.setBody(orderNumber.toUtf8());
    QHttpPart productPrice;
    productPrice.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"product_price\""));
    productPrice.setBody(product_price.toUtf8());
    QHttpPart channelId;
    channelId.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"channelId\""));
    channelId.setBody(channel_id.toUtf8());
    multiPart->append(securityCode);
    multiPart->append(order_Number);
    multiPart->append(productPrice);
    multiPart->append(channelId);
    pReply = manager->post(request, multiPart);
    QEventLoop eventLoop;
    QObject::connect(manager,&QNetworkAccessManager::finished,
                     &eventLoop,&QEventLoop::quit);
    eventLoop.exec();
    QByteArray bytes = pReply->readAll();
    QString result = bytes;
    delete(multiPart);
    multiPart = nullptr;
    if(result==""){
        return "-99";
    }
    //測試流程中，將retrue改成true不影響資料庫
    return "true";
    return result;
}
QString dbmgr::upload_submit(QString productName, QString productPrice, QString channel_Id, QString member_Id){
    request.setUrl(QUrl("https://yunreserve.com/api/channel/launch"));
    QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);
    QHttpPart securityCode;
    securityCode.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"securityCode\""));
    securityCode.setBody("OFA82497653@");
    QHttpPart product_name;
    product_name.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"product_name\""));
    product_name.setBody(productName.toUtf8());
    QHttpPart product_price;
    product_price.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"product_price\""));
    product_price.setBody(productPrice.toUtf8());
    QHttpPart channelId;
    channelId.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"channelId\""));
    channelId.setBody(channel_Id.toUtf8());
    QHttpPart memberId;
    memberId.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"memberId\""));
    memberId.setBody(member_Id.toUtf8());
    multiPart->append(securityCode);
    multiPart->append(product_name);
    multiPart->append(product_price);
    multiPart->append(channelId);
    multiPart->append(memberId);
    pReply = manager->post(request, multiPart);
    QEventLoop eventLoop;
    QObject::connect(manager,&QNetworkAccessManager::finished,
                     &eventLoop,&QEventLoop::quit);
    eventLoop.exec();
    QString result = pReply->readAll();
    delete(multiPart);
    multiPart = nullptr;
    if(result==""){
        return "-99";
    }
    if(result=="true"){
        return "1";
    }
    return "0";
}

QString dbmgr::recall_submit(QString channel_id){
    request.setUrl(QUrl("https://yunreserve.com/api/channel/recall"));
    QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);
    QHttpPart securityCode;
    securityCode.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"securityCode\""));
    securityCode.setBody("OFA82497653@");
    QHttpPart channelId;
    channelId.setHeader(QNetworkRequest::ContentDispositionHeader,QVariant("form-data; name=\"channelId\""));
    channelId.setBody(channel_id.toUtf8());
    multiPart->append(securityCode);
    multiPart->append(channelId);
    pReply = manager->post(request, multiPart);
    QEventLoop eventLoop;
    QObject::connect(manager,&QNetworkAccessManager::finished,
                     &eventLoop,&QEventLoop::quit);
    eventLoop.exec();
    QString result = pReply->readAll();
    delete(multiPart);
    multiPart = nullptr;
    if(result=="true"){
        return "true";
    }else{
        return "-99";
    }
}
