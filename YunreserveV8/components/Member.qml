import QtQuick 2.0

Item {
    id: member
    width: 1024
    height: 768

    Text {
        id: member_title
        text: qsTr(controller.member_title)
        font.family: "Noto Sans CJK TC Thin"
        anchors.verticalCenterOffset: -70
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        verticalAlignment: Text.AlignTop
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 36
    }

    Image {
        id: member_qrcode
        sourceSize.height: 200
        sourceSize.width: 200
        anchors.verticalCenterOffset: 65
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        source: "image://QZXing/encode/" + controller.qrcode_url +
                "?correctionLevel=M" +
                "&format=qrcode"
    }

    Image {
        id: member_back
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

}
