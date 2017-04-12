import QtQuick 2.4

Rectangle {
    width: 100; height: 30
    radius: 10
    opacity: 0.5; color: "yellow"

    Text {
        id: myText
        anchors.centerIn: parent
        font.pixelSize: 16
        font.bold: true
        text: "abc"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            // TODO:
            // Handle click
        }
    }
}
