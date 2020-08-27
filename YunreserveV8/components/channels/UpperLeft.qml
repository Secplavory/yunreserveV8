import QtQuick 2.0

Item {
    id: upperLeft
    width: 400
    height: 256

    Image {
        id: ch01
        width: 110
        height: 110
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        fillMode: Image.PreserveAspectFit
        state: controller.ch01
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch01
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch01
                    opacity: 1
                    enabled: true
                }
            }
        ]
        source: "../../img/channel/01-01.png"
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
                controller.channelClicked("1")
            }
        }
    }

    Image {
        id: ch02
        width: 110
        height: 110
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/02-01.png"
        state: controller.ch02
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch02
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch02
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
                controller.channelClicked("2")
            }
        }
    }

    Image {
        id: ch03
        width: 110
        height: 110
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/03-01.png"
        state: controller.ch03
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch03
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch03
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
                controller.channelClicked("3")
            }
        }
    }

    Image {
        id: ch04
        width: 110
        height: 110
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/04-01.png"
        state: controller.ch04
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch04
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch04
                    opacity: 1
                    enabled: true
                }
            }
        ]
    }

    Image {
        id: ch05
        width: 110
        height: 110
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/05-01.png"
        state: controller.ch05
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch05
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch05
                    opacity: 1
                    enabled: true
                }
            }
        ]
    }

    Image {
        id: ch06
        width: 110
        height: 110
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/06-01.png"
        state: controller.ch06
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch06
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch06
                    opacity: 1
                    enabled: true
                }
            }
        ]
    }

}
