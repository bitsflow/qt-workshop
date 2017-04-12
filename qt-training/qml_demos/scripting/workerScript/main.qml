import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Worker Script")
    id: root
    width: 480; height: 320
    visible: true
    color: "gray"

    WorkerScript {
        id: myWorker
        source: "qrc:/script/workerscript.js"

        onMessage: {
            console.log("Moved " + messageObject.xmove + " along the X axis.");
            console.log("Moved " + messageObject.ymove + " along the Y axis.");
            console.log("Moved " + messageObject.move + " pixels.");
        }
    }

    Rectangle {
        width: 200; height: 200
        anchors.left: parent.left; anchors.leftMargin: 20
        color: "red"

        MouseArea {
            anchors.fill: parent
            onClicked: myWorker.sendMessage( { rectangle: "red", x: mouse.x, y: mouse.y } );
        }
    }

    Rectangle {
        width: 200; height: 200
        anchors.right: parent.right; anchors.rightMargin: 20
        color: "blue"

        MouseArea {
            anchors.fill: parent
            onClicked: myWorker.sendMessage( { rectangle: "blue", x: mouse.x, y: mouse.y } );
        }
    }

    Text {
        text: "Click a Rectangle!"
        anchors { horizontalCenter: parent.horizontalCenter; bottom: parent.bottom; bottomMargin: 50 }
    }
}
