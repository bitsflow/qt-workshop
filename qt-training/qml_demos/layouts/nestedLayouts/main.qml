import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Nested Layouts")
    id: root
    width: 400; height: 400
    visible: true
    color: "gray"

    Rectangle {
        x: 50; y: 50
        width: parent.width - 2 * x
        height: parent.height - 2 * y
        color: "lightblue"

        Rectangle {
            x: 50; y: 50
            width: 50; height: 50
            color: "white"
        }
    }

    Rectangle {
        x: 50; y: 200
        width: parent.width - 2 * x
        height: (parent.height - 2 * x) / 2
        color: "green"

        Rectangle {
            x: 100; y: 50
            width: 800; height: 50
            color: "blue"
        }
    }
}
