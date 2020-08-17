import QtQuick 2.0

Item {
    id: chooseFunction
    width: 1024
    height: 768

    Image {
        id: chooseFunction_perchase
        width: 200
        height: 200
        anchors.horizontalCenterOffset: -250
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "../img/button/perchase.png"
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
                    controller.chooseFunction_perchase()
                }
            }
        }
    }

    Image {
        id: chooseFunction_upload
        width: 200
        height: 200
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "../img/button/lanch.png"
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
                    controller.chooseFunction_upload()
                }
            }
        }
    }

    Image {
        id: chooseFunction_recall
        width: 200
        height: 200
        anchors.horizontalCenterOffset: 250
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "../img/button/takeOff.png"
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
                    controller.chooseFunction_recall()
                }
            }
        }
    }

    Image {
        id: chooseFunction_signup
        width: 150
        height: 150
        anchors.verticalCenterOffset: 200
        anchors.horizontalCenterOffset: -175
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        source: "../img/button/signup.png"
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
                    controller.chooseFunction_signup()
                }
            }
        }
    }


    Image {
        id: chooseFunction_changeInfo
        width: 150
        height: 150
        anchors.verticalCenterOffset: 200
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "../img/button/changeUser.png"
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
                    controller.chooseFunction_changeInfo()
                }
            }
        }
    }



    Image {
        id: chooseFunction_forgetPassword
        x: 7
        y: 4
        width: 150
        height: 150
        anchors.horizontalCenterOffset: 175
        anchors.verticalCenterOffset: 200
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "../img/button/forgetUser.png"
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
                    controller.chooseFunction_forgetPassword()
                }
            }
        }
    }
}
