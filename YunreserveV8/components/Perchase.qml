import QtQuick 2.0
import "./payment"

Item {
    id: perchase
    width: 1024
    height: 768
    Text {
        id: payment_productName
        text: qsTr("商品："+controller.productInfo_name)
        font.family: "Noto Sans CJK TC Thin"
        anchors.verticalCenterOffset: -100
        anchors.left: parent.left
        anchors.leftMargin: 100
        anchors.verticalCenter: parent.verticalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 48
    }
    Text {
        id: payment_productPrice
        text: qsTr("價格："+controller.productInfo_price)
        font.family: "Noto Sans CJK TC Thin"
        anchors.verticalCenterOffset: 0
        anchors.left: parent.left
        anchors.leftMargin: 100
        anchors.verticalCenter: parent.verticalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 48
    }

    Item {
        id: paymentMethod
        width: parent.width
        height: 200
        anchors.verticalCenterOffset: 130
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        Rectangle{
            id: line1
            width: parent.width
            height: 3
            color: "black"
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Item {
            id: chooseMethod
            anchors.fill: parent
            state: "1"
            states: [
                State {
                    name: "0"
                    PropertyChanges {
                        target: chooseMethod
                        opacity: 0
                        enabled: false
                    }
                },
                State {
                    name: "1"
                    PropertyChanges {
                        target: chooseMethod
                        opacity: 1
                        enabled: true
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
            Text {
                id: chooseMethod_notify
                text: qsTr("付\n款\n方\n式")
                font.family: "Noto Sans CJK TC Thin"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 50
                lineHeight: 0.8
                font.pixelSize: 36
            }
            Image {
                id: chooseMethod_taiwanPay
                width: 150
                height: 150
                anchors.left: parent.left
                anchors.leftMargin: 150
                anchors.verticalCenter: parent.verticalCenter
                source: "../img/icon/taiwanPay_icon.jpg"
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
                        chooseMethod.state = "0"
                        taiwanPay.state = "1"
                    }
                }
            }
            Image {
                id: chooseMethod_linePay
                width: 150
                height: 150
                anchors.left: parent.left
                anchors.leftMargin: 350
                anchors.verticalCenter: parent.verticalCenter
                source: "../img/icon/linePay_icon.png"
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
                        chooseMethod.state = "0"
                        linePay.state = "1"
                    }
                }
            }
        }

        TaiwanPay{
            id: taiwanPay
            anchors.fill: parent
            state: "0"
            states: [
                State {
                    name: "0"
                    PropertyChanges {
                        target: taiwanPay
                        opacity: 0
                        enabled: false
                    }
                },
                State {
                    name: "1"
                    PropertyChanges {
                        target: taiwanPay
                        opacity: 1
                        enabled: true
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
        }
        LinePay{
            id: linePay
            anchors.fill: parent
            state: "0"
            states: [
                State {
                    name: "0"
                    PropertyChanges {
                        target: linePay
                        opacity: 0
                        enabled: false
                    }
                },
                State {
                    name: "1"
                    PropertyChanges {
                        target: linePay
                        opacity: 1
                        enabled: true
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
        }

        Rectangle {
            id: line2
            x: 9
            y: 5
            width: parent.width
            height: 3
            color: "#000000"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }



    Image {
        id: perchase_back
        width: 75
        height: 75
        anchors.horizontalCenterOffset: -100
        anchors.verticalCenterOffset: 275
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "../img/button/keepChooseChannel.png"
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
                    controller.setChannelState()
                }
            }
        }
    }
    Image {
        id: perchase_home
        width: 75
        height: 75
        anchors.horizontalCenterOffset: 100
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
