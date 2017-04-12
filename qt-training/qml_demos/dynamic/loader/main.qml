import QtQuick 2.4
import QtQuick.Window 2.2


Window {
    title: qsTr("Loader")
    id: root
    width: 200; height: 200
    visible: true
    color: "white"

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        font.pixelSize: 16
        text: loader.status != Loader.Ready ? "Click to add a rectangle!" : "Loaded!"
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            loader.source = "qrc:/MyRect.qml"
        }
        onDoubleClicked: {
            if (loader.item !== undefined) {
                loader.item.color = "blue"
            }
        }
    }
    Loader {
        id: loader
        anchors.centerIn: parent
    }
}
