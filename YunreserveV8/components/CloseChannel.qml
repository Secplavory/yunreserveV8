import QtQuick 2.0

Item {
    id: closeChannel_widget
    width: 1024
    height: 768

    AnimatedImage {
        id: closeChannel_notify
        width: 700
        height: 150
        anchors.verticalCenterOffset: 50
        fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "../img/word/close.gif"
    }

}
