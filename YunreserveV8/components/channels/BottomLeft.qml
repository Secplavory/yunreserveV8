import QtQuick 2.0

Item {
    id: bottomLeft
    width: 400
    height: 494

    Image {
        id: ch07
        width: 160
        height: 110
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/07-01.png"
        state: controller.ch07
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch07
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch07
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
                controller.channelClicked("7")
            }
        }
    }

    Image {
        id: ch08
        x: 9
        width: 160
        height: 110
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/08-01.png"
        state: controller.ch08
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch08
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch08
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
                controller.channelClicked("8")
            }
        }
    }

    Image {
        id: ch09
        width: 160
        height: 110
        anchors.verticalCenterOffset: -66
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/09-01.png"
        state: controller.ch09
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch09
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch09
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
                controller.channelClicked("9")
            }
        }
    }

    Image {
        id: ch10
        x: 240
        width: 160
        height: 110
        anchors.verticalCenterOffset: -66
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/10-01.png"
        state: controller.ch10
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch10
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch10
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
                controller.channelClicked("10")
            }
        }
    }

    Image {
        id: ch11
        width: 160
        height: 110
        anchors.verticalCenterOffset: 61
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/11-01.png"
        state: controller.ch11
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch11
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch11
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
                controller.channelClicked("11")
            }
        }
    }

    Image {
        id: ch12
        x: 240
        width: 160
        height: 110
        anchors.verticalCenterOffset: 61
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/12-01.png"
        state: controller.ch12
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch12
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch12
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
                controller.channelClicked("12")
            }
        }
    }

    Image {
        id: ch13
        width: 160
        height: 110
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/13-01.png"
        state: controller.ch13
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch13
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch13
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
                controller.channelClicked("13")
            }
        }
    }

    Image {
        id: ch14
        width: 160
        height: 110
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/14-01.png"
        state: controller.ch14
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch14
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch14
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
                controller.channelClicked("14")
            }
        }
    }

}
