import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Particles 2.0

Window {
    visible: true
    width: 400; height: 600
    color: "black"

    ParticleSystem {
        anchors.fill: parent

        Emitter {
            x: parent.width/2
            y: parent.height

            emitRate: 500
            lifeSpan: 4500
            lifeSpanVariation: 500
            size: 16

            velocity: AngleDirection { magnitude: 300; angle: -90; angleVariation: 2 }
            acceleration: PointDirection { y: -100; xVariation: 10 }
        }

        ImageParticle {
            source: "qrc:/images/particle.png"
            redVariation: 0.4
        }

        Gravity {
            magnitude: 200
        }
    }
}
