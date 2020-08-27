import QtQuick 2.0

Item {
    id: contract
    width: 1024
    height: 768

    Text {
        id: contract_title
        text: qsTr("合約內容")
        font.family: "Noto Sans CJK TC Thin"
        anchors.verticalCenterOffset: -60
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 36
    }

    Image {
        id: contract_qrcode
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
        id: contract_back
        width: 75
        height: 75
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
                    controller.to_page("ChooseChannel")
                }
            }
        }
    }



}
