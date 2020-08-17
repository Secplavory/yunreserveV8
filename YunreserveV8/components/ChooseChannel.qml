import QtQuick 2.0

Item {
    id: chooseChannel
    width: 1024
    height: 768

    Image {
        id: chooseChannel_home
        width: 75
        height: 75
        anchors.verticalCenterOffset: 275
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "../img/button/HOME.png"
        fillMode: Image.PreserveAspectFit
        MouseArea{
            anchors.fill: parent
            onPressed: {
                if(measureRadius(parent.width/2, mouseX, mouseY)){
                    parent.opacity = 0.3
                }
            }
            onReleased: {
                parent.opacity = 1
            }
            onClicked: {
                if(measureRadius(parent.width/2, mouseX, mouseY)){
                    controller.toLastPage("Welcome")
                }
            }
        }
    }


}
