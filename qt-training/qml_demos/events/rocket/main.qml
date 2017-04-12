import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("MouseArea Hover")
    id: root
    width: 300; height: 300
    visible: true
    color: "black"

    Rectangle {
        id: rocketHighlight
        anchors.centerIn: rocket
        rotation: rocket.rotation
        width: rocket.width + 5; height: rocket.height + 5
        smooth: true
        radius: 10; color: "black"
        border.color: "white"; border.width: 2
        visible: myMouse.containsMouse && rocket.opacity != 0
    }

    Image {
        id: rocket

        anchors.centerIn: parent
        source: "qrc:/images/rocket_small.png"
        smooth: true

        Behavior on opacity {
            NumberAnimation { duration: 300 }
        }

        focus: true
        Keys.onLeftPressed:
            rocket.rotation = (rocket.rotation - 10) % 360;
        Keys.onRightPressed:
            rocket.rotation = (rocket.rotation + 10) % 360;

        // Could be replace by
        // Keys.onSpacePressed:
        Keys.onPressed: {
            if (event.key === Qt.Key_Space) {
                console.log("Space key pressed");
                event.accepted = true;
            }
        }
    }

    MouseArea {
        id: myMouse
        anchors.fill: rocket
        hoverEnabled: true
        // See Qt::MouseButtons for a list of available buttons
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onDoubleClicked: {
            // "mouse" is the object representing the mouse event,
            // delivered automatically with the signal
            if (mouse.button === Qt.LeftButton)
                rocket.rotation = rocket.rotation - 90;
            else
                rocket.rotation = rocket.rotation + 90;
        }
    }
}
