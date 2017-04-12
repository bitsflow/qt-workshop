import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Path Animation")
    id: window
    width: 320; height: 480;
    visible: true
    color: "#000040"

    Canvas {
        id: canvas
        anchors.fill: parent
        smooth: true

        onPaint: {
            var context = canvas.getContext("2d")
            context.clearRect(0, 0, width, height)
            context.strokeStyle = "white"
            context.path = pathAnim.path
            context.stroke()
        }
    }

    Item {
        id: rocket
        x: 0; y: 0
        width: 128; height: 96

        Image {
            source: "qrc:/images/rocket.png"
            anchors.centerIn: parent
            rotation: 90
        }

        MouseArea {
            anchors.fill: parent
            onClicked: pathAnim.running ? pathAnim.stop() : pathAnim.start()
        }
    }

    PathAnimation {
        id: pathAnim
        duration: 2000
        easing.type: Easing.InOutQuad

        target: rocket
        orientation: PathAnimation.RightFirst
        anchorPoint: Qt.point(rocket.width/2, rocket.height/2)

        path: Path {
            startX: rocket.width/2; startY: rocket.height/2

            PathCubic {
                x: window.width - rocket.width/2
                y: window.height - rocket.height/2

                control1X: x; control1Y: rocket.height/2
                control2X: rocket.width/2; control2Y: y
            }
            PathCubic {
                x: window.width - rocket.width/2
                y: window.height - rocket.height/2

                control1X: x; control1Y: rocket.height/2
                control2X: rocket.width/2; control2Y: y
            }
        }
    }
}
