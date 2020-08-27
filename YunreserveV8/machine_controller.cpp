#include "machine_controller.h"

machine_controller::machine_controller()
{

}

bool machine_controller::checkDoor(){
    QString filePath="C:/Users/user/Desktop/cabinet/Status.txt";
    QFile file(filePath);
    if(!file.open(QIODevice::ReadOnly|QIODevice::Text)){
        return false;
    }else{
        while(!file.atEnd()){
            QByteArray line = file.readLine();
            QString str(line);
            if(str.mid(6,1)=="0"){
                file.close();
                QFile file(filePath);
                file.remove();
                return false;
            }
        }
        return true;
    }
}

bool machine_controller::openDoor(QString channel){
    QString controlPath="C:/Users/user/Desktop/cabinet/Control.txt";
    QString statusPath="C:/Users/user/Desktop/cabinet/Status.txt";
    QFile file(controlPath);
    if(!file.open(QIODevice::WriteOnly|QIODevice::Text)){
        return false;
    }else{
        QTextStream out(&file);
        out << "Cmd=Unlock-"+channel+"\nEnd";
        file.close();
        QEventLoop loop;
        QTimer::singleShot(1000,&loop,SLOT(quit()));
        loop.exec();
        QFile file(statusPath);
        file.remove();
        return true;
    }
}
