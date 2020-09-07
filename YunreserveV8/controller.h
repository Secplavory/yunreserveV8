#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>
#include <QEventLoop>
#include <QTimer>
#include <QRegularExpression>
#include <QRegularExpressionMatch>

#include <QJsonDocument>
#include <QJsonArray>

#include <dbmgr.h>
#include <recorder.h>
#include <machine_controller.h>

#include <QDebug>

class controller : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString pageSource READ pageSource WRITE setPageSource NOTIFY pageSourceChanged)
    Q_PROPERTY(QString pageState READ pageState WRITE setPageState NOTIFY pageStateChanged)
    Q_PROPERTY(QString qrcode_url READ qrcode_url NOTIFY qrcode_urlChanged)
    Q_PROPERTY(QString member_title READ member_title NOTIFY member_titleChanged)
    Q_PROPERTY(QString productInfo_name READ productInfo_name NOTIFY productInfoChanged)
    Q_PROPERTY(QString productInfo_price READ productInfo_price NOTIFY productInfoChanged)
    Q_PROPERTY(QString taiwanPay_QRcode READ taiwanPay_QRcode NOTIFY taiwanPay_QRcodeChanged)
    Q_PROPERTY(QString disconnected_warning READ disconnected_warning WRITE setDisconnected_warning NOTIFY disconnected_warningChanged)

    Q_PROPERTY(QString ch01 READ ch01 NOTIFY channelChanged)
    Q_PROPERTY(QString ch02 READ ch02 NOTIFY channelChanged)
    Q_PROPERTY(QString ch03 READ ch03 NOTIFY channelChanged)
    Q_PROPERTY(QString ch04 READ ch04 NOTIFY channelChanged)
    Q_PROPERTY(QString ch05 READ ch05 NOTIFY channelChanged)
    Q_PROPERTY(QString ch06 READ ch06 NOTIFY channelChanged)

    Q_PROPERTY(QString ch07 READ ch07 NOTIFY channelChanged)
    Q_PROPERTY(QString ch08 READ ch08 NOTIFY channelChanged)
    Q_PROPERTY(QString ch09 READ ch09 NOTIFY channelChanged)
    Q_PROPERTY(QString ch10 READ ch10 NOTIFY channelChanged)
    Q_PROPERTY(QString ch11 READ ch11 NOTIFY channelChanged)
    Q_PROPERTY(QString ch12 READ ch12 NOTIFY channelChanged)
    Q_PROPERTY(QString ch13 READ ch13 NOTIFY channelChanged)
    Q_PROPERTY(QString ch14 READ ch14 NOTIFY channelChanged)

    Q_PROPERTY(QString ch15 READ ch15 NOTIFY channelChanged)
    Q_PROPERTY(QString ch16 READ ch16 NOTIFY channelChanged)
    Q_PROPERTY(QString ch17 READ ch17 NOTIFY channelChanged)
    Q_PROPERTY(QString ch18 READ ch18 NOTIFY channelChanged)
    Q_PROPERTY(QString ch19 READ ch19 NOTIFY channelChanged)
    Q_PROPERTY(QString ch20 READ ch20 NOTIFY channelChanged)

    Q_PROPERTY(QString ch21 READ ch21 NOTIFY channelChanged)
    Q_PROPERTY(QString ch22 READ ch22 NOTIFY channelChanged)
    Q_PROPERTY(QString ch23 READ ch23 NOTIFY channelChanged)
    Q_PROPERTY(QString ch24 READ ch24 NOTIFY channelChanged)
    Q_PROPERTY(QString ch25 READ ch25 NOTIFY channelChanged)
    Q_PROPERTY(QString ch26 READ ch26 NOTIFY channelChanged)
    Q_PROPERTY(QString ch27 READ ch27 NOTIFY channelChanged)
    Q_PROPERTY(QString ch28 READ ch28 NOTIFY channelChanged)

public:
    controller();
    QString pageSource(){return pageSource_url;}
    QString pageState(){return pageState_text;}
    QString qrcode_url(){return qrcode_url_text;}
    QString member_title(){return member_title_text;}
    QString productInfo_name(){return productInfo_name_text;}
    QString productInfo_price(){return productInfo_price_text;}
    QString taiwanPay_QRcode(){return taiwanPay_QRcode_text;}
    QString disconnected_warning(){return disconnected_warning_state;}

    QString ch01(){return channelStates[0];}
    QString ch02(){return channelStates[1];}
    QString ch03(){return channelStates[2];}
    QString ch04(){return channelStates[3];}
    QString ch05(){return channelStates[4];}
    QString ch06(){return channelStates[5];}

    QString ch07(){return channelStates[6];}
    QString ch08(){return channelStates[7];}
    QString ch09(){return channelStates[8];}
    QString ch10(){return channelStates[9];}
    QString ch11(){return channelStates[10];}
    QString ch12(){return channelStates[11];}
    QString ch13(){return channelStates[12];}
    QString ch14(){return channelStates[13];}

    QString ch15(){return channelStates[14];}
    QString ch16(){return channelStates[15];}
    QString ch17(){return channelStates[16];}
    QString ch18(){return channelStates[17];}
    QString ch19(){return channelStates[18];}
    QString ch20(){return channelStates[19];}

    QString ch21(){return channelStates[20];}
    QString ch22(){return channelStates[21];}
    QString ch23(){return channelStates[22];}
    QString ch24(){return channelStates[23];}
    QString ch25(){return channelStates[24];}
    QString ch26(){return channelStates[25];}
    QString ch27(){return channelStates[26];}
    QString ch28(){return channelStates[27];}

signals:
    void pageSourceChanged();
    void pageStateChanged();
    void qrcode_urlChanged();
    void member_titleChanged();
    void productInfoChanged();
    void taiwanPay_QRcodeChanged();
    void disconnected_warningChanged();

    void channelChanged();
public slots:
    void setDisconnected_warning(QString state);
    void to_page(QString source);
    void setFunction(QString handler);
    void setRestartTimer(QString handler);
    void getMemberQrcode(QString handler);
    void getContractQrcode();
    void setChannelState();
    void channelClicked(QString channelId);
    void recall_submit();
    void admin_management();
    QString check_taiwanPay();
    QString linePay_submit(QString oneTimeKey);
    QString login_submit(QString acc, QString pwd);
    QString upload_submit(QString productName, QString productPrice);
private:
    void setPageSource(QString url){
        setPageState("0");
        QEventLoop loop;
        QTimer::singleShot(500, &loop, SLOT(quit()));
        loop.exec();
        pageSource_url = url;
        emit pageSourceChanged();
        setPageState("1");
    }
    void setPageState(QString state){
        pageState_text = state;
        emit pageStateChanged();
    }
    void restartTimer_signal(){
        restartTimer->stop();
        to_page("Welcome");
    }
    void checkDoorTimer_signal(){
        bool handler = mc->checkDoor();
        if(handler==true){
            checkDoorTimer->stop();
            to_page("Thanks");
            restartTimer->start(5000);
        }
    }
    void snapShot(){
        int count = rc->snapshot();
        QString result_tmp = db->snapShot_upload(count);
    }

    QString pageSource_url = "Welcome";
    QString pageState_text = "1";
    QTimer* restartTimer = new QTimer(this);

    QString functionHandler = "";
    QString qrcode_url_text = "";
    QString member_title_text = "";
    QString disconnected_warning_state = "0";

    QString member_id = "";

    QList<QString> channelStates = {
        "0", "0", "0", "0", "0", "0", "0",
        "0", "0", "0", "0", "0", "0", "0",
        "0", "0", "0", "0", "0", "0", "0",
        "0", "0", "0", "0", "0", "0", "0"
    };

    QString channel_id = "";
    QString productInfo_name_text = "";
    QString productInfo_price_text = "";
    QString QRcode_orderNumber = "";
    QString taiwanPay_QRcode_text = "";

    dbmgr* db = new dbmgr();
    machine_controller* mc = new machine_controller();
    QTimer* checkDoorTimer = new QTimer(this);
    QTimer* snapShotTimer = new QTimer(this);

    recorder* rc = new recorder();
};

#endif // CONTROLLER_H
