import QtQuick 2.4
import QtQuick.Window 2.2
import "qrc:/MyScripts.js" as Scripts

Window {
    title: qsTr("Create Component")
    id: root
    width: 150; height: 100
    visible: true
    color: "black"

    Row {
        anchors.centerIn: parent; spacing: 25
        Rectangle {
            id: first
            width: 50; height: 50; color: "red"
            MouseArea {
                anchors.fill: parent
                onClicked: { Scripts.createObject(first) }
            }
        }
        Rectangle {
            id: second
            width: 50; height: 50; color: "red"
            MouseArea {
                anchors.fill: parent
                onClicked: { Scripts.createObject(second) }
            }
        }
    }
}
