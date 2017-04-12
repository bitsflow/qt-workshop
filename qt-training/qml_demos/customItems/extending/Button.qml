import QtQuick 2.4

Rectangle {
    width: 100; height: 30
    radius: 10
    property alias color: myText.color
    opacity: 0.5

    // Instead of creating a new property, we will use an alias
    property alias buttonText: myText.text
    signal buttonClicked()

    Text {
        id: myText
        anchors.centerIn: parent
        font.pixelSize: 16
        font.bold: true
        text: "Click me!"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            // Handle button click and emit a signal
            // to inform possible observers
            buttonClicked();
        }
    }
}
