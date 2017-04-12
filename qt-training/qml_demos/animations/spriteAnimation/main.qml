import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Sprite Animation")
    id: window
    width: 360; height: 360;
    visible: true
    color: "#000040"

    AnimatedSprite {
        id: animSprite
        width: parent.width * 0.25
        height: parent.height * 0.25
        running: true
        source: "qrc:/images/snowflake.png"
        frameCount: 51  // Frame width automatically calculated
        frameDuration: 10
    }

    MouseArea {
        anchors.fill: parent
        onDoubleClicked: {
            Qt.quit();
        }
        onClicked: {
            animSprite.running ? animSprite.stop() : animSprite.start();
        }
    }
}
