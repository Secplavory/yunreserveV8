import QtQuick 2.0

Item {
    id: upperRight
    width: 400
    height: 256

    Image {
        id: ch15
        width: 110
        height: 110
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/15-01.png"
        state: controller.ch15
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch15
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch15
                    opacity: 1
                    enabled: true
                }
            }
        ]
    }

    Image {
        id: ch16
        width: 110
        height: 110
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/16-01.png"
        state: controller.ch16
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch16
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch16
                    opacity: 1
                    enabled: true
                }
            }
        ]
    }

    Image {
        id: ch17
        width: 110
        height: 110
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/17-01.png"
        state: controller.ch17
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch17
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch17
                    opacity: 1
                    enabled: true
                }
            }
        ]
    }

    Image {
        id: ch18
        width: 110
        height: 110
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/18-01.png"
        state: controller.ch18
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch18
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch18
                    opacity: 1
                    enabled: true
                }
            }
        ]
    }

    Image {
        id: ch19
        width: 110
        height: 110
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/19-01.png"
        state: controller.ch19
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch19
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch19
                    opacity: 1
                    enabled: true
                }
            }
        ]
    }

    Image {
        id: ch20
        width: 110
        height: 110
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        fillMode: Image.PreserveAspectFit
        source: "../../img/channel/20-01.png"
        state: controller.ch20
        states: [
            State {
                name: "0"
                PropertyChanges {
                    target: ch20
                    opacity: 0.3
                    enabled: false
                }
            },
            State {
                name: "1"
                PropertyChanges {
                    target: ch20
                    opacity: 1
                    enabled: true
                }
            }
        ]
    }
}
