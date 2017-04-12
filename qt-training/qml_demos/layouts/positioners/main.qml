import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Positioners")
    id: root
    width: 400; height: 400
    visible: true
    color: "gray"

    Column {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 50

        Rectangle {
            width: parent.width
            height: root.height / 2

            color: "lightblue"

            Rectangle {
                x: 50; y: 50
                width: 50; height: 50
                color: "white"
            }
        }

        Rectangle {
            width: parent.width
            height: root.height / 2
            color: "green"

            Rectangle {
                x: 100; y: 50
                width: 800; height: 50
                color: "blue"
            }
        }
    }
}
