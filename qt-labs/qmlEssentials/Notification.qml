import QtQuick 2.5

Rectangle {
    property alias someName: textField.text
    readonly property real pi: 3.1415925
    signal randomSignal(int x, int y, var mouse)

    function show(notificationText) {
        var helloWorld = 1;
        // if (notificationText === pi)
        textField.text = notificationText;
    }

    gradient: Gradient {
        GradientStop {
            position: 0.00;
            color: "#000000";
        }
        GradientStop {
            position: 1.00;
            color: "#b9b3b3";
        }
    }

    Text {
        id: textField
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("Hello world")
        width: parent.width
        height: parent.height
        fontSizeMode: Text.Fit
        minimumPixelSize: 10
        font.pixelSize: 108
        wrapMode: Text.WordWrap
        color: "white"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                randomSignal(mouse.x, mouse.y, mouse);
            }
        }
    }
}
