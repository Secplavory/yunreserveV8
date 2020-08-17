#ifndef RECORDER_H
#define RECORDER_H

extern "C"
{
    #include <libavcodec/avcodec.h>
    #include <libavformat/avformat.h>
    #include <libswscale/swscale.h>
    #include <libavdevice/avdevice.h>
}

#include <QTimer>
#include <QDebug>

class recorder : public QTimer
{
public:
    recorder();
};

#endif // RECORDER_H
