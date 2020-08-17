import QtQuick 2.0
import QtQuick.Controls 2.12

Item {
    id: login
    width: 1024
    height: 768
    Item {
        id: login_formContainer
        width: 525
        height: 200
        anchors.verticalCenterOffset: 25
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter


        Text {
            id: login_notify
            x: 262
            height: 36
            text: qsTr("請登入帳號")
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 0
            font.pixelSize: 36
        }

        TextField {
            id: login_account_input
            x: 262
            y: 50
            width: 525
            height: 50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 75
            anchors.left: parent.left
            anchors.leftMargin: 0
            placeholderText: qsTr("請輸入帳號，6~18碼")
        }

        TextField {
            id: login_password_input
            x: 262
            y: 459
            width: 525
            height: 50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            placeholderText: qsTr("請輸入密碼，6~12碼")
            anchors.left: parent.left
            anchors.leftMargin: 0
        }

        Image {
            id: login_submit
            width: 60
            height: 60
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            source: "../img/button/submit.png"
            fillMode: Image.PreserveAspectFit
        }



    }

    Image {
        id: login_back
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

/*##^##
Designer {
    D{i:2;anchors_y:341}D{i:3;anchors_height:50;anchors_y:389}D{i:4;anchors_y:459}
}
##^##*/
