import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Scribble Area")
    id: window
    width: 600
    height: 600
    visible: true

    color: "white"

    property var paths: [[]]

    MouseArea {
        anchors.fill: parent

        function pushPoint(mouse) {
            window.paths[window.paths.length-1].push(Qt.point(mouse.x, mouse.y))
            canvas.requestPaint()
        }

        onPressed: pushPoint(mouse)

        onReleased: {
            pushPoint(mouse)
            window.paths.push([])
        }

        onPositionChanged: pushPoint(mouse)
    }

    Canvas {
        id: canvas
        anchors.fill: parent

        onPaint: {
            var context = getContext("2d")
            context.clearRect(0, 0, width, height)

            context.strokeStyle = "black"
            context.lineWidth = 2

            for (var i = 0; i<window.paths.length; i++) {
                var path = window.paths[i]

                context.beginPath()
                for (var j = 0; j<path.length; j++) {
                    var point = path[j]
                    if (j==0) {
                        context.moveTo(point.x, point.y)
                    } else {
                        context.lineTo(point.x, point.y)
                    }
                }
                context.stroke();
            }
        }
    }
}
