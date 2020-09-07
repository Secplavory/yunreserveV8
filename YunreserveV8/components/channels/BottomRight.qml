import QtQuick 2.0

Item {
    id: bottomRight
    width: 400
    height: 494

    Image {
        id: ch21
        width: 160
        height: 110
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/21-01.png"
        state: controller.ch21
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch21
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch21
                    opacity: 1
                    enabled: true
                }
            }
        ]
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
                controller.channelClicked("21")
            }
        }
    }

    Image {
        id: ch22
        x: 9
        width: 160
        height: 110
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/22-01.png"
        state: controller.ch22
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch22
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch22
                    opacity: 1
                    enabled: true
                }
            }
        ]
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
                controller.channelClicked("22")
            }
        }
    }

    Image {
        id: ch23
        width: 160
        height: 110
        anchors.verticalCenterOffset: -66
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/23-01.png"
        state: controller.ch23
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch23
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch23
                    opacity: 1
                    enabled: true
                }
            }
        ]
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
                controller.channelClicked("23")
            }
        }
    }

    Image {
        id: ch24
        x: 240
        width: 160
        height: 110
        anchors.verticalCenterOffset: -66
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/24-01.png"
        state: controller.ch24
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch24
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch24
                    opacity: 1
                    enabled: true
                }
            }
        ]
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
                controller.channelClicked("24")
            }
        }
    }

    Image {
        id: ch25
        width: 160
        height: 110
        anchors.verticalCenterOffset: 61
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/25-01.png"
        state: controller.ch25
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch25
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch25
                    opacity: 1
                    enabled: true
                }
            }
        ]
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
                controller.channelClicked("25")
            }
        }
    }

    Image {
        id: ch26
        x: 240
        width: 160
        height: 110
        anchors.verticalCenterOffset: 61
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/26-01.png"
        state: controller.ch26
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch26
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch26
                    opacity: 1
                    enabled: true
                }
            }
        ]
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
                controller.channelClicked("26")
            }
        }
    }

    Image {
        id: ch27
        width: 160
        height: 110
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/27-01.png"
        state: controller.ch27
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch27
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch27
                    opacity: 1
                    enabled: true
                }
            }
        ]
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
                controller.channelClicked("27")
            }
        }
    }

    Image {
        id: ch28
        width: 160
        height: 110
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/28-01.png"
        state: controller.ch28
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch28
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch28
                    opacity: 1
                    enabled: true
                }
            }
        ]
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
                controller.channelClicked("28")
            }
        }
    }
}
