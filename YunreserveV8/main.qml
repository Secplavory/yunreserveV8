import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: window
    visible: true
//    visibility: Window.FullScreen
    screen: Qt.application.screens[1]
    width: 1024
    height: 768
    title: qsTr("Yunreserve")

    Text {
        id: disconnected_warning
        color: "#ff2626"
        text: qsTr("連線不穩定，請稍號再嘗試。謝謝")
        z: 99
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        state: controller.disconnected_warning
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: disconnected_warning
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: disconnected_warning
                    opacity: 1
                    enabled: true
                }
            }
        ]
        onStateChanged: {
            if(state==="1"){
                disconnected_warning_timer.restart()
            }
        }
        Timer{
            id: disconnected_warning_timer
            interval: 30000
            repeat: false
            running: false
            triggeredOnStart: false
            onTriggered: {
                controller.setDisconnected_warning("0")
            }
        }
    }
    Image {
        id: window_background
        anchors.fill: parent
        source: "img/background/background.jpg"
        fillMode: Image.PreserveAspectCrop
        Image {
            id: brandIcon
            width: 300
            height: 300
            anchors.horizontalCenterOffset: -7
            anchors.verticalCenterOffset: -250
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/icon/brandIcon.png"
            fillMode: Image.PreserveAspectFit
        }
    }

    Loader{
        id: pageLoader
        width: parent.width
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 0
        anchors.verticalCenter: parent.verticalCenter
        source: "./components/" + controller.pageSource + ".qml"
        state: controller.pageState
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: pageLoader
                    opacity: 0
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: pageLoader
                    opacity: 1
                    enabled: true
                }
            },
            State {
                name: "2"
                PropertyChanges {
                    target: pageLoader
                    opacity: 1
                    enabled: false
                }
            }
        ]
        transitions: [
            Transition {
                NumberAnimation{
                    properties: "opacity"
                    easing.type: Easing.InOutQuad
                    duration: 500
                }
            }
        ]
        function measureRadius(radius, positionX, positionY){
            var distanceX = positionX - radius
            var distanceY = positionY - radius
            var distance = Math.sqrt(Math.pow(distanceX, 2) + Math.pow(distanceY, 2))
            if(distance < radius){
                return true
            }else{
                return false
            }
        }
    }

}
