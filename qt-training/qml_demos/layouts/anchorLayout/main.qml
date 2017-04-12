import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Anchoring")
    id: root
    width: 400; height: 400
    visible: true
    color: "gray"

    Rectangle {
        anchors.fill: parent
        anchors.margins: 50
        color: "lightblue"

        Rectangle {
            x: 50; y: 50
            width: 50; height: 50
            color: "white"
        }
    }

    Rectangle {
        x: 50; y: 200
        anchors.top: parent.top
        anchors.topMargin: y

        anchors.left: parent.left
        anchors.leftMargin: x

        anchors.right: parent.right
        anchors.rightMargin: x

        height: (parent.height - 2 * x) / 2

        color: "green"

        Rectangle {
            x: 100; y: 50
            width: 800; height: 50
            color: "blue"
        }
    }
}
