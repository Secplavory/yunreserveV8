#include "recorder.h"

recorder::recorder()
{
    screen = QApplication::primaryScreen();
}

int recorder::snapshot(){
    if(count == 5){
        count = 0;
    }
    count += 1;

    QPixmap pix = screen->grabWindow(0);
    pix.save("./screenShot/snap"+QString::number(count)+".jpg");

    return count;
}

