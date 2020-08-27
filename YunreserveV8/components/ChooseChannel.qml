import QtQuick 2.0
import "channels"

Item {
    id: chooseChannel
    width: 1024
    height: 768

    UpperLeft{
        width: 375
        height: 231
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 15
    }

    BottomLeft{
        width: 375
        height: 494
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
    }

    UpperRight{
        width: 375
        height: 231
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 15
    }

    BottomRight{
        width: 375
        height: 494
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
    }

    Text {
        id: chooseChannel_contractText
        text: qsTr("使用前請詳閱合約")
        font.family: "Noto Sans CJK TC Thin"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 24

        Image {
            id: contract_btn
            width: 75
            height: 75
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            source: "../img/button/contract.png"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    controller.setRestartTimer("0")
                    parent.opacity = 0.3
                }
                onReleased: {
                    controller.setRestartTimer("1")
                    parent.opacity = 1
                }
                onClicked: {
                    controller.getContractQrcode()
                }
            }
        }

    }

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
                    controller.setRestartTimer("0")
                    parent.opacity = 0.3
                }
            }
            onReleased: {
                controller.setRestartTimer("1")
                parent.opacity = 1
            }
            onClicked: {
                if(measureRadius(parent.width/2, mouseX, mouseY)){
                    controller.to_page("Welcome")
                }
            }
        }
    }

}
