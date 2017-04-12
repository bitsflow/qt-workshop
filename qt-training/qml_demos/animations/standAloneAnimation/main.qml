import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Standalone Animation")
    id: root
    width: 200; height: 200
    visible: true
    color: "black"

    PropertyAnimation {
        id: animation
        target: rect; properties: "x,y"
        duration: 1000
    }
    Rectangle {
        id: rect; width: 100; height: 100; color: "red"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                animation.to = 50;
                animation.running = true; // Or: animation.start()
            }
        }
    }
}
