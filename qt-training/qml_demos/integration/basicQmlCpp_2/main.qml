import QtQuick 2.0

Rectangle {
    width: 200; height: 100
    color: "lightblue"
    Text {
        anchors.centerIn: parent
        font.pixelSize: 18
        text: "I'm QML in a C++ app!"
    }
}
