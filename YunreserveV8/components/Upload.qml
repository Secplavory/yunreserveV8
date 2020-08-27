import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQuick.VirtualKeyboard.Settings 2.0
import QtQuick.VirtualKeyboard.Styles 2.15

Item {
    id: upload
    width: 1024
    height: 768
    Item {
        id: upload_item
        width: 525
        height: 200
        anchors.verticalCenterOffset: 25
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        Text {
            id: upload_notify
            text: qsTr("上架商品資訊")
            font.family: "Noto Sans CJK TC Thin"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 10
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 36
        }
        TextField {
            id: upload_inputProductName
            y: 374
            width: 525
            height: 50
            font.family: "Noto Sans CJK TC Thin"
            inputMethodHints: "ImhNoAutoUppercase"
            placeholderText: qsTr("請輸入商品名稱(中英文或數字)")
            maximumLength: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 75
            anchors.horizontalCenter: parent.horizontalCenter
            onTextChanged: {
                controller.setRestartTimer("1")
            }
            onPressed: {
                controller.setRestartTimer("1")
            }
        }
        TextField {
            id: upload_inputProductPrice
            width: 525
            height: 50
            font.family: "Noto Sans CJK TC Thin"
            inputMethodHints: "ImhDigitsOnly"
            placeholderText: qsTr("請輸入商品價格，最少10元")
            maximumLength: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            onTextChanged: {
                controller.setRestartTimer("1")
            }
            onPressed: {
                controller.setRestartTimer("1")
            }
        }
        Image {
            id: upload_submit
            width: 60
            height: 60
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            fillMode: Image.PreserveAspectFit
            source: "../img/button/submit.png"
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
                        var a = controller.upload_submit(upload_inputProductName.text, upload_inputProductPrice.text)
                        if(a==="-1"){
                            upload_warning.text = "名稱不能包含空白鍵及標點符號";
                            upload_inputProductName.text = "";
                        }else
                        if(a==="-2"){
                            upload_warning.text = "價格只能為數字";
                            upload_inputProductPrice.text = "";
                        }else
                        if(a==="0"){
                            upload_warning.text = "例外錯誤，請稍後嘗試";
                        }
                    }
                }
            }
        }
        Text {
            id: upload_warning
            color: "#ff0404"
            text: qsTr("")
            anchors.top: parent.top
            anchors.topMargin: 20
            font.family: "Noto Sans CJK TC Thin"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            anchors.left: parent.left
            anchors.leftMargin: 250
            font.pixelSize: 24
        }
        NumberAnimation{
            id: upload_animationY
            target: upload_item
            properties: "anchors.verticalCenterOffset"
            to: -60
            easing.type: Easing.InOutQuad
        }
        NumberAnimation{
            id: upload_animationY_reverse
            target: upload_item
            properties: "anchors.verticalCenterOffset"
            to: 0
            easing.type: Easing.InOutQuad
        }
    }
    Image {
        id: upload_back
        width: 75
        height: 75
        anchors.horizontalCenterOffset: -100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
        source: "../img/button/keepChooseChannel.png"
        MouseArea{
            anchors.fill: parent
            onPressed: {
                parent.opacity = 0.3
            }
            onReleased: {
                parent.opacity = 1
            }
            onClicked: {
                controller.setChannelState()
            }
        }
    }
    Image {
        id: upload_home
        width: 75
        height: 75
        anchors.horizontalCenterOffset: 100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
        source: "../img/button/HOME.png"
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
                controller.to_page("Welcome")
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
                upload_animationY.start()
            }
            if(!active){
                upload_animationY_reverse.start()
                window_background.forceActiveFocus()
            }
        }

        Component.onCompleted: {
            VirtualKeyboardSettings.activeLocales=["zh_TW","en_US"]
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
