import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Colors")
    id: root
    width: 400; height: 400
    visible: true
    color: "black"

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            // anchors.fill: parent
            GradientStop {
                position: 0.0; color: "green"
            }
            GradientStop {
                position: 1.0; color: "blue"
            }
        }
    }
}
