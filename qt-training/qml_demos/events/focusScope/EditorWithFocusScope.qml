import QtQuick 2.4

FocusScope {
    property alias text: editor.text

    Rectangle {
        id: rectangle
        anchors.fill: parent

        TextInput {
            id: editor
            anchors.centerIn: parent
            focus: true
        }
    }
}
