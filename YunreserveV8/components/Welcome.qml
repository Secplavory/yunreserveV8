import QtQuick 2.0

Item {
    id: welcome
    width: 1024
    height: 768

    AnimatedImage {
        id: welcome_notify
        width: 425
        height: 125
        anchors.verticalCenterOffset: 225
        fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "../img/word/clickText.gif"
    }

    Image {
        id: welcome_title
        width: 650
        height: 200
        anchors.verticalCenterOffset: 25
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "../img/word/welcomeText.png"
        fillMode: Image.PreserveAspectFit
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            controller.welcome_clicked()
        }
    }



}
