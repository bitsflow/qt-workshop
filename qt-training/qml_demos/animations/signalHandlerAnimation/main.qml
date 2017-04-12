import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Signal Handler Animation")
    id: root
    width: 200; height: 200
    visible: true
    color: "black"

    Rectangle {
        id: rect
        width: 100; height: 100
        color: "red"

        MouseArea {
            anchors.fill: parent
            onClicked: PropertyAnimation { target: rect; properties: "x,y"; to: 50; duration: 1000 }
        }
    }
}
