import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2

ApplicationWindow {
    title: qsTr("Hello World")
    width: 200
    height: 100
    visible: true

    Canvas {
        id: root
        anchors.fill: parent
        property int margin: 20
        onPaint: {
            var ctx = getContext("2d");
            ctx.lineWidth = Math.floor(root.width * 0.01);
            ctx.strokeStyle = "blue";
            ctx.fillStyle = "lightblue";
            ctx.beginPath();
            // top-left start point
            ctx.moveTo(margin, margin); // upper line
            ctx.lineTo(root.width - margin, margin); // right line
            ctx.lineTo(root.width - margin, root.height - margin); // bottom line
            ctx.lineTo(margin, root.height - margin);
            ctx.closePath();
            ctx.fill();
            // ctx.clip(); // Clipping is easy with shapes, created using paths

            var fontSize = Math.floor(root.width * 0.1);
            ctx.font = fontSize + "px Verdana";
            // Create gradient
            var gradient = ctx.createLinearGradient(0, 0, root.width, root.height);
            gradient.addColorStop("0","red");
            gradient.addColorStop("0.5","green");
            gradient.addColorStop("1.0","blue");
            ctx.fillStyle = gradient;
            ctx.textAlign = "center"; // or use measureText()
            ctx.fillText("Hello World!", root.width / 2, (root.height + fontSize) / 2);
            ctx.stroke();
        }
    }
}
