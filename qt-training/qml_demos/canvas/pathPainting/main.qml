import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Path Painting")
    width: 600
    height: 600
    visible: true
    color: "azure"

    Canvas {
        anchors.fill: parent

        onPaint: {
            var context = getContext("2d")
            context.clearRect(0, 0, width, height)

            context.fillRule = Qt.OddEvenFill
            context.fillStyle = "forestgreen"
            context.beginPath()
            context.moveTo(60, 60)
            context.bezierCurveTo(540, 60, 60, 540, 540, 540)
            context.bezierCurveTo(540, 60, 60, 540, 60, 60)
            context.closePath()
            context.rect(120, 120, 360, 360)
            context.fill()
        }
    }
}
