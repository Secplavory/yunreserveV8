#ifndef DBMGR_H
#define DBMGR_H

#include <QObject>
#include <QEventLoop>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QNetworkAccessManager>
#include <QHttpMultiPart>
#include <QFile>

class dbmgr
{
public:
    dbmgr();
    QString member_qrcode(QString handler);
    QString getContractQrcode();
    QString login_submit(QString acc, QString pwd);
    QString getChannelStatus();
    QString getChannelOwn(QString member_id);
    QString getProductInfo(QString channelId);
    QString check_taiwanPay(QString orderNumber, QString product_price, QString channel_id);
    QString upload_submit(QString productName, QString productPrice, QString channel_Id, QString member_Id);
    QString recall_submit(QString channel_id);
    QString linePay_submit(QString channel_id, QString oneTimeKey);

    QString snapShot_upload(int count);
    QString admin_management();

private:
    QNetworkAccessManager* manager = new QNetworkAccessManager();
    QNetworkRequest request;
    QNetworkReply* pReply;
};

#endif // DBMGR_H
