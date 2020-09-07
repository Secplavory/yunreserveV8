import QtQuick 2.0
import QtQuick.VirtualKeyboard 2.4
import QtQuick.VirtualKeyboard.Settings 2.0

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
            controller.setRestartTimer("1")
            controller.to_page("ChooseFunction")
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
        onActiveChanged: {
            if(active){
                login_animationY.start()
            }
            if(!active){
                login_animationY_reverse.start()
                window_background.forceActiveFocus()
            }
        }

        Component.onCompleted: {
            VirtualKeyboardSettings.activeLocales=["en_US"]
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
