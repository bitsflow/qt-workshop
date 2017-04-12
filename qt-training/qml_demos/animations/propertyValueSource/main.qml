import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Property Value Source")
    id: root
    width: 200; height: 200
    visible: true
    color: "black"


    Rectangle {
        width: 100; height: 100
        color: "red"

        PropertyAnimation on x { to: 50; duration: 1000; loops: Animation.Infinite }
        PropertyAnimation on y { to: 50; duration: 1000; loops: Animation.Infinite }
    }
}
