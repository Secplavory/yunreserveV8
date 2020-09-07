#ifndef RECORDER_H
#define RECORDER_H

//extern "C"
//{
//    #include <libavcodec/avcodec.h>
//    #include <libavformat/avformat.h>
//    #include <libswscale/swscale.h>
//    #include <libavdevice/avdevice.h>
//}

#include <QScreen>
#include <QPixmap>
#include <QApplication>

class recorder
{
public:
    recorder();
    int snapshot();

private:
    QScreen* screen;
    int count = 0;
};

#endif // RECORDER_H
