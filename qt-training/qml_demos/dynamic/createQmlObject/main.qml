import QtQuick 2.4
import QtQuick.Window 2.2


Window {
    title: qsTr("Create QML Object")
    id: root
    width: 150; height: 100
    visible: true
    color: "white"

    MouseArea {
        anchors.fill: parent
        onClicked: {
            var newObject = Qt.createQmlObject('import QtQuick 2.0; Text { text: "I am new!" }', root);
            // Note that these could also be set in the object string itself, just as an
            // example we set them here separately:
            newObject.anchors.centerIn = parent;
            newObject.font.pixelSize = 20;
        }
    }
}
