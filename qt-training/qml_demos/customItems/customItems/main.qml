import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Custom Items")
    id: root
    width: 150
    height: 150
    visible: true
    color: "black"

    Button {
        anchors.centerIn: parent
    }

    Button {
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
