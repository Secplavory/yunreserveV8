import QtQuick 2.0

Item {
    width: 1024
    height: 200
    Image {
        id: taiwanPay_QRcode
        anchors.right: parent.right
        anchors.rightMargin: 50
        anchors.verticalCenter: parent.verticalCenter
        source: "image://QZXing/encode/" + controller.taiwanPay_QRcode +
                "?correctionLevel=M" +
                "&format=qrcode"
        sourceSize.width: 150
        sourceSize.height: 150
    }
    Text {
        id: taiwanPay_warning
        color: "#fd2424"
        text: qsTr("")
        font.family: "Noto Sans CJK TC Thin"
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignTop
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 24
        onTextChanged: {
            taiwanPay_warning_timer.restart()
        }
        Timer{
            id: taiwanPay_warning_timer
            interval: 5000
            repeat: false
            running: false
            triggeredOnStart: false
            onTriggered: {
                taiwanPay_warning.text = ""
                taiwanPay_warning_timer.stop()
            }
        }
    }

    Text {
        id: taiwanPay_notify
        text: qsTr("請使用台灣Pay行動支付掃碼付款\n完成請點擊確認付款按鈕")
        font.family: "Noto Sans CJK TC Thin"
        anchors.left: parent.left
        anchors.leftMargin: 200
        anchors.verticalCenter: parent.verticalCenter
        font.pointSize: 24
        Image {
            id: taiwanPay_submit
            width: 75
            height: 75
            fillMode: Image.PreserveAspectFit
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -10
            source: "../../img/button/checkpayment.png"
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
                    taiwanPay_warning.text = "請稍後"
                    var a = controller.check_taiwanPay()
                    if(a==="0"){
                        taiwanPay_warning.text = "尚未付款"
                    }
                }
            }
        }
    }
    Image {
        id: taiwanPay_back
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
                taiwanPay.state = "0"
                chooseMethod.state = "1"
            }
        }
    }
}
