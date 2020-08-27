import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQuick.VirtualKeyboard.Settings 2.0

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
        Text {
            id: login_warning
            color: "#f70000"
            text: qsTr("")
            anchors.left: parent.left
            anchors.leftMargin: 200
            anchors.top: parent.top
            anchors.topMargin: 26
            font.pixelSize: 24
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
            inputMethodHints: "ImhNoAutoUppercase"
            placeholderText: qsTr("請輸入帳號，6~18碼")
            onTextChanged: {
                controller.setRestartTimer("1");
            }
            onPressed: {
                controller.setRestartTimer("1")
            }
        }
        TextField {
            id: login_password_input
            x: 262
            y: 459
            width: 525
            height: 50
            echoMode: "Password"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            placeholderText: qsTr("請輸入密碼，6~12碼")
            anchors.left: parent.left
            anchors.leftMargin: 0
            onTextChanged: {
                controller.setRestartTimer("1");
            }
            onPressed: {
                controller.setRestartTimer("1")
            }
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
                        var a = controller.login_submit(login_account_input.text, login_password_input.text)
                        if(a==="-1"){
                            login_account_input.text = ""
                            login_warning.text = "帳號格式錯誤"
                        }else
                        if(a==="-2"){
                            login_password_input.text = ""
                            login_warning.text = "密碼格式錯誤"
                        }else
                        if(a==="0"){
                            login_account_input.text = ""
                            login_password_input.text = ""
                            login_warning.text = "帳號密碼錯誤"
                        }
                    }
                }
            }
        }
        NumberAnimation{
            id: login_animationY
            target: login_formContainer
            properties: "anchors.verticalCenterOffset"
            to: -60
            easing.type: Easing.InOutQuad
        }
        NumberAnimation{
            id: login_animationY_reverse
            target: login_formContainer
            properties: "anchors.verticalCenterOffset"
            to: 0
            easing.type: Easing.InOutQuad
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
