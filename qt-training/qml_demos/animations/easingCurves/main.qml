import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Easing Curves")
    id: root
    width: 200; height: 200
    visible: true
    color: "black"

    Rectangle {
        width: 50; height: 50
        color: "red"

        PropertyAnimation on x { to: 150; duration: 1000; easing.type: Easing.OutBounce; loops: Animation.Infinite }
    }
}
