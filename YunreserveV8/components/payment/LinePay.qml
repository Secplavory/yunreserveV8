import QtQuick 2.0
import QtQuick.Controls 2.12

Item {
    id: element
    width: 1024
    height: 200
    Text {
        id: linePay_notify
        text: qsTr("請使用LinePay，點選\"我的條碼\"\n並使用下方掃描器付款")
        font.family: "Noto Sans CJK TC Thin"
        anchors.left: parent.left
        anchors.leftMargin: 250
        anchors.verticalCenter: parent.verticalCenter
        font.pointSize: 24
    }
    TextField{
        id: linePay_input
        anchors.left: parent.left
        anchors.leftMargin: -200
        anchors.top: parent.top
        anchors.topMargin: -100
        opacity: 1
        onTextChanged: {
            controller.setRestartTimer("0")
            linePay_input_trigger.restart()
            perchase_back.enabled = false
            perchase_home.enabled = false
            linePay_back.enabled = false
            linePay_warning.text = "付款中"
        }
    }
    Text {
        id: linePay_warning
        color: "#ff2222"
        text: qsTr("")
        font.family: "Noto Sans CJK TC Thin"
        font.pointSize: 18
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        onTextChanged: {
            linePay_warning_timer.restart()
        }
        Timer{
            id: linePay_warning_timer
            interval: 5000
            triggeredOnStart: false
            repeat: false
            running: false
            onTriggered: {
                linePay_warning.text = ""
                warning_timer.stop()
            }
        }
    }
    Image {
        id: linePay_back
        width: 75
        height: 50
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        source: "../../img/button/back.png"
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
                linePay.state = "0"
                chooseMethod.state = "1"
            }
        }
    }
    Timer{
        id: linePay_input_trigger
        interval: 2000
        repeat: false
        running: false
        triggeredOnStart: false
        onTriggered: {
            var a = controller.linePay_submit(linePay_input.text)
            if(a==="0"){
                linePay_input.text = ""
                linePay_input_trigger.stop()
                perchase_back.enabled = true
                perchase_home.enabled = true
                linePay_back.enabled = true
                linePay_warning.text = "請確認帳戶餘額，多次失敗請聯絡管理員"
                controller.setRestartTimer("1")
            }
        }
    }
    onStateChanged: {
        if(state=="1"){
            linePay_input.forceActiveFocus()
        }
    }
}
