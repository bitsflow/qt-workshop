import QtQuick 2.3

Rectangle {
    width: 100
    height: 62

    signal customItem1Signal

    color: Qt.rgba(0.3, 0.8, 0.3, 1.0);

    MouseArea {
        anchors.fill: parent
        onClicked: customItem1Signal();
    }

}
