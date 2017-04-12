import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    visible: true
    width: 360
    height: 360

    CustomItem1 {
        anchors.fill: parent
        id: customItem1
    }

    CustomItem2 {
        hello: customItem1
    }
}
