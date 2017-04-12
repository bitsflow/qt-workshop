import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1

Window {
    title: qsTr("Qt Quick Layouts")
    id: root
    width: 400; height: 400
    visible: true
    color: "gray"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 50

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "lightblue"

            Rectangle {
                x: 50; y: 50
                width: 50; height: 50
                color: "white"
            }
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "green"

            Rectangle {
                x: 100; y: 50
                width: 800; height: 50
                color: "blue"
            }
        }
    }
}
