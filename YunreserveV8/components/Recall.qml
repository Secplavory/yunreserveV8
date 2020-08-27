import QtQuick 2.0

Item {
    id: recall
    width: 1024
    height: 768
    Text {
        id: recall_productName
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
        id: recall_productPrice
        text: qsTr("價格："+controller.productInfo_price)
        font.family: "Noto Sans CJK TC Thin"
        anchors.verticalCenterOffset: 25
        anchors.left: parent.left
        anchors.leftMargin: 100
        anchors.verticalCenter: parent.verticalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 48
    }
    Text {
        id: recall_notify
        text: qsTr("是否下架此商品")
        font.family: "Noto Sans CJK TC Thin"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 241
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignTop
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 36
    }
    Image {
        id: recall_circle
        width: 100
        height: 100
        anchors.horizontalCenterOffset: -100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 125
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
        source: "../img/button/O.png"
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
                controller.recall_submit()
            }
        }
    }
    Image {
        id: recall_cross
        width: 100
        height: 100
        anchors.horizontalCenterOffset: 100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 125
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
        source: "../img/button/X.png"
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
                controller.setChannelState()
            }
        }
    }
}
