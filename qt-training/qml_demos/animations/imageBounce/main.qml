import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Image Bounce")
    id: root
    width: 120; height: 300;
    visible: true

    Image {
        id: img
        source: "qrc:/images/face-smile.png"
        anchors.horizontalCenter: parent.horizontalCenter
        y: 0

        MouseArea {
            anchors.fill: parent
            // Toggle animation on/off when clicked
            onClicked: anim.running = !anim.running
        }

        SequentialAnimation on y {
            id: anim
            running: false; loops: Animation.Infinite
            YAnimator {
                easing.amplitude: 1.6
                to: 300-img.height; easing.type: Easing.InOutElastic; duration: 2000
            }
            PauseAnimation { duration: 1000 }
            YAnimator {
                to: 0; easing.type: Easing.OutQuad; duration: 1000
            }
        }
    }
}
