import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("PinchArea")
    id: root
    width: 1024; height: 600
    visible: true
    color: "steelblue"

    Image {
        source: "qrc:/images/qt-logo.jpg"

        PinchArea {
            anchors.fill: parent
            pinch.target: parent

            pinch.minimumScale: 0.5
            pinch.maximumScale: 2.0

            pinch.minimumRotation: -3600
            pinch.maximumRotation: 3600

            pinch.dragAxis: Pinch.XAxis
        }
    }
}
