import QtQuick 2.0

Rectangle {
    id: rect
    width: 80; height: 80
    color: "red"

    NumberAnimation on opacity {
        to: 0
        duration: 2000

        onRunningChanged: {
            if (!running) {
                console.log("Destroying...")
                rect.destroy();
            }
        }
    }
}
