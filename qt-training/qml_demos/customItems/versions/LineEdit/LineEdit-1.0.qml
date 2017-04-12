import QtQuick 2.0

Rectangle {
    border.color: "green"
    border.width: 5
    color: "white"
    radius: 4; smooth: true

    TextInput {
        anchors.fill: parent
        anchors.margins: 2
        text: "Enter text..."
        color: focus ? "black" : "gray"
        font.pixelSize: parent.height - 4
    }
}
