import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Repeater")
    id: root
    width: 1024; height: 600
    visible: true
    color: "black"

    Grid {
        id: grid
        anchors.fill: parent
        spacing: 2
        columns: 10
        // Grid has children, which are Rectangles
        Component.onCompleted: children[2].color = "blue";

        Repeater {
            model: 100
            Rectangle {
                // parent: grid
                width: parent.width / parent.columns - parent.spacing
                height: width
                color: "white"
                MouseArea {
                    anchors.fill: parent
                    // Index is exposed in the sub-context by the repeater
                    onClicked: console.log("Item",index,"pressed");
                }
            }
        }
    }
}
