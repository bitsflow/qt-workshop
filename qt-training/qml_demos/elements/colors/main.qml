import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Colors")
    id: root
    width: 300; height: 100
    visible: true
    color: "black"

    Rectangle {
        x: 0; y: 0; width: 100; height: 100; color: "#ff0000"
    }
    Rectangle {
        x: 100; y: 0; width: 100; height: 100
        color: Qt.rgba(0,0.75,0,1)
    }
    Rectangle {
        x: 200; y: 0; width: 100; height: 100; color: "blue"
    }
}
