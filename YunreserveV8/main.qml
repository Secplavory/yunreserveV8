﻿import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4

Window {
    id: window
    visible: true
//    visibility: Window.FullScreen
    screen: Qt.application.screens[0]
    width: 1024
    height: 768
    title: qsTr("Yunreserve")
    Image {
        id: window_background
        anchors.fill: parent
        source: "img/background/background.jpg"
        fillMode: Image.PreserveAspectCrop
        Image {
            id: brandIcon
            width: 300
            height: 300
            anchors.verticalCenterOffset: -250
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "img/icon/brandIcon.png"
            fillMode: Image.PreserveAspectFit
        }
    }


    Loader{
        id: pageLoader
        anchors.fill: parent
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

    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}