#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>
#include <QEventLoop>
#include <QTimer>

#include <recorder.h>

#include <QDebug>

class controller : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString pageSource READ pageSource WRITE setPageSource NOTIFY pageSourceChanged)
    Q_PROPERTY(QString pageState READ pageState WRITE setPageState NOTIFY pageStateChanged)
public:
    controller();
    QString pageSource(){return pageSource_url;}
    QString pageState(){return pageState_text;}
signals:
    void pageSourceChanged();
    void pageStateChanged();
public slots:
    void welcome_clicked();
    void chooseFunction_perchase();
    void chooseFunction_upload();
    void chooseFunction_recall();
    void chooseFunction_signup();
    void chooseFunction_changeInfo();
    void chooseFunction_forgetPassword();

    void toLastPage(QString url){setPageSource(url);}
private:
    void setPageSource(QString url){
        setPageState("0");
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
    QString pageSource_url = "Welcome";
    QString pageState_text = "1";
    QEventLoop loop;

    QString functionHandler = "";
};

#endif // CONTROLLER_H
