import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Focus Scope")
    id: root
    width: 300; height: 300
    visible: true
    color: "black"

    Grid {
        anchors.centerIn: parent
        columns: 2
        spacing: 5
        EditorWithFocusScope {
            width: root.width / parent.columns - parent.columnSpacing; height: width
            text: "Editor 1"
            Component.onCompleted: {
                console.log("Editor 1 created");
            }
        }
        EditorWithFocusScope {
            width: root.width / parent.columns - parent.columnSpacing; height: width
            text: "Editor 2"

            Component.onCompleted: {
                console.log("Editor 2 created");
            }
        }
        EditorWithFocusScope {
            width: root.width / parent.columns - parent.columnSpacing; height: width
            text: "Editor 3"
            focus: true
            Component.onCompleted: {
                console.log("Editor 3 created");
            }
        }
        EditorWithFocusScope {
            width: root.width / parent.columns - parent.columnSpacing; height: width
            text: "Editor 4"
            Component.onCompleted: {
                console.log("Editor 4 created");
            }
        }
    }
}
