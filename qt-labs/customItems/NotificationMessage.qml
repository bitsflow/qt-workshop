import QtQuick 2.5

Rectangle {
    width: 100
    height: 100
    opacity: 0.2
    visible: opacity > 0.2

    function show(notificationText) {
        textField.text = notificationText;
        opacity = 0.7;
        timer.start();
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
        text: qsTr("Notification")
        width: parent.width
        height: parent.height
        fontSizeMode: Text.Fit
        minimumPixelSize: 10
        font.pixelSize: 108
        wrapMode: Text.WordWrap
        color: "white"
    }

    Timer {
        id: timer
        interval: 2000
        onTriggered: {
            parent.opacity = 0.2;
        }
    }
}

