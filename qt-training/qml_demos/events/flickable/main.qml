import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Flickable")
    id: root
    width: 200; height: 100
    visible: true

    Flickable {
        anchors.fill: parent
        contentWidth: image.width;
        contentHeight: image.height
        flickableDirection: Flickable.HorizontalFlick
        // boundsBehavior: Flickable.StopAtBounds
        Image { id: image; source: "qrc:/images/qt_logo.png" }
    }
}
