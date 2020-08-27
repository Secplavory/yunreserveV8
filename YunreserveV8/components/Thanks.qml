import QtQuick 2.0

Item {
    id: thanks
    width: 1024
    height: 768
    Image {
        id: thanks_notify
        width: 1024
        height: 200
        anchors.verticalCenterOffset: 50
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "../img/word/thanks.png"
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: perchase_back
        width: 75
        height: 75
        anchors.horizontalCenterOffset: -100
        anchors.verticalCenterOffset: 275
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "../img/button/keepChooseChannel.png"
        fillMode: Image.PreserveAspectFit
        MouseArea{
            anchors.fill: parent
            onPressed: {
                if(measureRadius(parent.width/2, mouseX, mouseY)){
                    controller.setRestartTimer("0")
                    parent.opacity = 0.3
                }
            }
            onReleased: {
                controller.setRestartTimer("5000")
                parent.opacity = 1
            }
            onClicked: {
                if(measureRadius(parent.width/2, mouseX, mouseY)){
                    controller.setChannelState()
                    controller.setRestartTimer("1")
                }
            }
        }
    }
    Image {
        id: perchase_home
        width: 75
        height: 75
        anchors.horizontalCenterOffset: 100
        anchors.verticalCenterOffset: 275
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "../img/button/HOME.png"
        fillMode: Image.PreserveAspectFit
        MouseArea{
            anchors.fill: parent
            onPressed: {
                if(measureRadius(parent.width/2, mouseX, mouseY)){
                    controller.setRestartTimer("0")
                    parent.opacity = 0.3
                }
            }
            onReleased: {
                controller.setRestartTimer("5000")
                parent.opacity = 1
            }
            onClicked: {
                if(measureRadius(parent.width/2, mouseX, mouseY)){
                    controller.to_page("Welcome")
                    controller.setRestartTimer("0")
                }
            }
        }
    }
}
