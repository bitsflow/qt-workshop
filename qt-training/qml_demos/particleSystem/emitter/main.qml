import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Particles 2.0

Window {
    visible: true
    width: 400; height: 400
    color: "white"

    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: emitter.burst(20)
    }

    ParticleSystem {
        anchors.fill: parent
        Emitter {
            id: emitter
            anchors.fill: parent
            enabled: false
            lifeSpan: 1000
            size: 64
        }

        ImageParticle {
            source: "qrc:/images/particle.png"
            redVariation: 1.0
            greenVariation: 1.0
            blueVariation: 1.0
        }
    }
}
