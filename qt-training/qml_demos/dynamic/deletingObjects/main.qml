import QtQuick 2.4
import QtQuick.Window 2.2


Window {
    title: qsTr("Deleting Objects")
    id: root
    width: 500; height: 100
    visible: true
    color: "white"

    Component.onCompleted: {
        var component = Qt.createComponent("SelfDestroyingRect.qml");
        for (var i=0; i<5; i++) {
            var object = component.createObject(root);
            object.x = (object.width + 10) * i;
        }
    }
}
