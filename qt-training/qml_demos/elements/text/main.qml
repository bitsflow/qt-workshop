import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Colors")
    id: root
    width: 400; height: 400
    visible: true
    color: "lightblue"

    Text {
        x: 100; y: 100
        text: "Qt Quick"
        font.family: "Helvetica"
        font.pixelSize: 32
    }
}
