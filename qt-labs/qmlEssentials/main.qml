import QtQuick 2.5
import QtQuick.Controls 1.4

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Image App")

    Notification {
        anchors.fill: parent
        // someName: qsTr("Some Notification")
        onRandomSignal: {
            console.log(x,y,mouse);
        }
        Component.onCompleted: {
            show(qsTr("Some text"));
        }
    }
}



