import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Multi Touch")
    id: root
    width: 1024; height: 600
    visible: true
    color: "black"

    Text {
        id: text
        text: "Let your fingers do the walking"
        font.pointSize: 20
        anchors.centerIn: parent
    }

    MultiPointTouchArea {
        anchors.fill: parent
        touchPoints: [
            TouchPoint { id: point1 },
            TouchPoint { id: point2 },
            TouchPoint { id: point3 }
        ]
        onTouchUpdated: {
            var str = "Count: " + touchPoints.length + "\n"
            for( var i=0; i < touchPoints.length; i++) {
                str = str + touchPoints[i].pointId + ": (" + touchPoints[i].x + " , " + touchPoints[i].y + ")\n"
            }
            text.text = str
        }
    }

    Box {
        color: "green"
        point: point1
    }

    Box {
        color: "blue"
        point: point2
    }

    Box {
        color: "yellow"
        point: point3
    }
}
