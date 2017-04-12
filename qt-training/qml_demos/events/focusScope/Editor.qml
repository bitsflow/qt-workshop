import QtQuick 2.4

Rectangle {
    width: 100
    height: 62

    property alias text: editor.text

    TextInput {
        id: editor
        anchors.centerIn: parent
        focus: true
    }
}

