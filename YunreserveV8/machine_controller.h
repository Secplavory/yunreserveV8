#ifndef MACHINE_CONTROLLER_H
#define MACHINE_CONTROLLER_H

#include <QObject>
#include <QFile>
#include <QDebug>
#include <QEventLoop>
#include <QTimer>

class machine_controller
{
public:
    machine_controller();
    bool checkDoor();
    bool openDoor(QString channel);
};

#endif // MACHINE_CONTROLLER_H
