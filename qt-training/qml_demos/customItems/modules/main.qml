import QtQuick 2.4
import QtQuick.Window 2.2
import "qrc:/components"

Window {
    title: qsTr("Modules")
    id: root
    width: 150
    height: 150
    visible: true

    Rectangle {
        id: mainRect
        anchors.fill: parent
        color: "black"

        Button {  // Or: MyComps.MyButton
            anchors.centerIn: parent
            buttonText: "Cowabunga!"
            onButtonClicked: console.log("Center button clicked!");
        }

        Button {
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            onButtonClicked: console.log("Top button clicked!");
        }

        Button {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            onButtonClicked: console.log("Bottom button clicked!");
        }
    }

}
