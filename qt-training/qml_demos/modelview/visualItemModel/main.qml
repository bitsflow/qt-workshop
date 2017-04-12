import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Model View")
    id: root
    width: 300; height: 200
    visible: true
    color: "black"

    VisualItemModel {
        id: labels
        Rectangle { color: "#cc7777"; radius: 10.0
            width: 300; height: 50
            Text { anchors.fill: parent
                font.pointSize: 32; text: "Books"
                horizontalAlignment: Qt.AlignHCenter } }
        Rectangle { color: "#cccc55"; radius: 10.0
            width: 300; height: 50
            Text { anchors.fill: parent
                font.pointSize: 32; text: "Music"
                horizontalAlignment: Qt.AlignHCenter } }
        Rectangle { color: "#99cccc"; radius: 10.0
            width: 300; height: 50
            Text { anchors.fill: parent
                font.pointSize: 32; text: "Movies"
                horizontalAlignment: Qt.AlignHCenter } }
    }

    ListView {
        anchors.fill: parent
        model: labels
    }
}
