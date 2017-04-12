import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Behavior")
    id: root
    width: 200; height: 200
    visible: true
    color: "black"

    Rectangle {
        id: rect
        width: 100; height: 100
        color: "red"

        Behavior on x { PropertyAnimation { easing.amplitude: 2.9; easing.type: Easing.InElastic; duration: 500 } }
        Behavior on y { PropertyAnimation { duration: 500 } }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: { rect.x = mouse.x; rect.y = mouse.y }
    }
}
