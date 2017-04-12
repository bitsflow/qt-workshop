import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("MouseArea Drag")
    id: root
    width: 600
    height: 200
    visible: true
    color: "white"


    Image {
        id: pic; source: "qrc:/images/face-smile.png"
        anchors.verticalCenter: parent.verticalCenter
        opacity: (root.width - pic.x) / root.width;
        MouseArea {
            anchors.fill: parent
            drag.target: pic
            drag.axis: "XAxis" // Cannot drag along XandYAxis because of the anchor!
            drag.minimumX: 0
            drag.maximumX: root.width - pic.width
        }
    }
}
