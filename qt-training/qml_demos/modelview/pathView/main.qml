import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Path View")
    id: root
    width: 300; height: 250
    visible: true
    color: "white"

    ListModel {
        id: nameModel
        ListElement { file: "qrc:/images/rocket.svg"
            name: "rocket" }
        ListElement { file: "qrc:/images/clear.svg"
            name: "clear" }
        ListElement { file: "qrc:/images/arrow.svg"
            name: "arrow" }
        ListElement { file: "qrc:/images/book.svg"
            name: "book" }
    }

    Component {
        id: nameDelegate
        Column {
            opacity: PathView.opacity
            scale: PathView.scale
            z: PathView.z
            Image {
                id: delegateImage
                anchors.horizontalCenter: delegateText.horizontalCenter
                source: file; width: 64; height: 64; smooth: true
                fillMode: Image.PreserveAspectFit
            }
            Text {
                id: delegateText
                text: name; font.pixelSize: 24
            }
        }
    }

    PathView {
        anchors.fill: parent
        model: nameModel
        delegate: nameDelegate
        focus: true
        visible: true
        path: Path {
            startX: 150; startY: 200
            PathAttribute { name: "opacity"; value: 1.0 }
            PathAttribute { name: "scale"; value: 1.0 }
            PathAttribute { name: "z"; value: 0 }
            PathCubic { x: 50; y: 150; control1X: 100; control1Y: 200
                control2X: 50; control2Y: 175 }
            PathAttribute { name: "opacity"; value: 0.5 }
            PathAttribute { name: "scale"; value: 0.5 }
            PathAttribute { name: "z"; value: -1 }
            PathCubic { x: 150; y: 120; control1X: 50; control1Y: 135
                control2X: 100; control2Y: 120 }
            PathAttribute { name: "opacity"; value: 0.25 }
            PathAttribute { name: "scale"; value: 0.25 }
            PathAttribute { name: "z"; value: -2 }
            PathCubic { x: 250; y: 150; control1X: 200; control1Y: 120
                control2X: 250; control2Y: 135 }
            PathAttribute { name: "opacity"; value: 0.5 }
            PathAttribute { name: "scale"; value: 0.5 }
            PathAttribute { name: "z"; value: -1 }
            PathCubic { x: 150; y: 200; control1X: 250; control1Y: 175
                control2X: 200; control2Y: 200 }
        }
        highlight: Rectangle {
            radius: 4
            width: 10; height: 10
            color: "lightblue"
            visible: PathView.onPath
        }
    }
}
