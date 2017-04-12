import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Parent Change")
    id: root
    width: 300; height: 400
    visible: true
    color: "black"

    Item {
        anchors.fill: parent
        id: container

        Rectangle {
            color : "blue"

            width : 100
            height: 100
            Rectangle {
                id: myRect
                width: 20; height: 20
                y : 50
                x : 20
                color: "red"
            }
            id  : blueRect

        }
        Rectangle {
            x : 200
            width : 100
            height: 100
            color : "yellow"
            id  : yellowRect
        }


        states: State {
            name: "reanchored"
            ParentChange {
                target: myRect
                parent : yellowRect
                x : 60
                y : 20
            }
        }

        transitions: Transition {
            ParentAnimation {
                NumberAnimation {
                    properties : "x,y"
                    duration: 1000
                }
            }
        }

        MouseArea {
            anchors.fill : parent
            onClicked: container.state = "reanchored"
        }
    }
}
