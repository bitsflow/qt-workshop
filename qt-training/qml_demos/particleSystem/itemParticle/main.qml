import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Particles 2.0
import "qrc:/content/script.js" as Script

Window {
    visible: true
    width: 640
    height: 480
    Item {
        id: root
        width: 640
        height: 480
        Rectangle {
            anchors.fill: parent
            color: "black"
            z: -1
        }
        Item {
            id: loading
            Behavior on opacity {NumberAnimation {}}
            anchors.fill: parent
            Text {
                anchors.centerIn: parent
                text: "Loading"
                color: "white"
            }
        }
        ParticleSystem {
            id: sys;
            running: true
        }
        Emitter {
            id: emitter
            system: sys
            height: parent.height - 132/2
            x: -132/2
            y: 132/2
            velocity: PointDirection { x: 32; xVariation: 8 }
            emitRate: 0.5
            lifeSpan: Emitter.InfiniteLife
            group: "photos"
        }
        Age {
            system: sys
            x: parent.width + 132/2
            height: parent.height
            width: 1000
        }
        ImageParticle {
            system: sys
            groups: ["fireworks"]
            source: "qrc:/images/star.png"
            color: "lightsteelblue"
            alpha: 0
            colorVariation: 0
            z: 1000
        }
        ItemParticle {
            id: mp
            z: 0
            system: sys
            fade: false
            groups: ["photos"]
        }
        Component {
            id: alertDelegate
            Rectangle {
                width: 132
                height: 132
                NumberAnimation on scale {
                    running: true
                    loops: 1
                    from: 0.2
                    to: 1
                }
                Image {
                    source: "qrc:/images/rocket.png"
                    anchors.centerIn: parent
                }
                Text {
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "A new ship has arrived!"
                }
            }
        }
        property Item alertItem;
        function alert() {
            //resetter.active = false
            force.enabled = true;
            alertItem = alertDelegate.createObject(root);
            alertItem.x = root.width/2 - alertItem.width/2
            alertItem.y = root.height/2 - alertItem.height/2
            spawnFireworks.pulse(200);
            stopAlert.start();
        }
        focus: true
        Keys.onSpacePressed: alert();
        Timer {
            id: stopAlert
            running: false
            repeat: false
            interval: 800
            onTriggered: {
                force.enabled = false
                //resetter.active = true;
                mp.take(root.alertItem, true);
                centerEmitter.burst(1);
            }
        }
        Attractor {
            id: force
            system: sys
            pointX: root.width/2
            pointY: root.height/2
            strength: -10000
            enabled: false
            anchors.centerIn: parent
            width: parent.width/2
            height: parent.height/2
            groups:["photos"]
            affectedParameter: Attractor.Position
        }
        Emitter {
            id: centerEmitter
            velocity: PointDirection { x: 32; xVariation: 8;}
            emitRate: 0.5
            lifeSpan: 12000 //TODO: A -1 or something which does 'infinite'? (but need disable fade first)
            maximumEmitted: 20
            group: "photos"
            system: sys
            anchors.centerIn: parent
            enabled: false

            //TODO: Zoom in effect
        }
        Emitter {
            id: spawnFireworks
            group: "fireworks"
            system: sys
            maximumEmitted: 400
            emitRate: 400
            lifeSpan: 2800
            x: parent.width/2
            y: parent.height/2 - 64
            width: 8
            height: 8
            enabled: false
            size: 32
            endSize: 8
            velocity: AngleDirection { magnitude: 160; magnitudeVariation: 120; angleVariation: 90; angle: 270 }
            acceleration: PointDirection { y: 160 }
        }
        Item { x: -1000; y: -1000 //offscreen
            Repeater {//Load them here, add to system on completed
                model: theModel
                delegate: theDelegate
            }
        }

        RssModel {id: theModel; tags:"particle,particles"}

        Component {
            id: theDelegate
            Rectangle {
                id: container
                border.width: 2
                antialiasing: true
                property real myRand: Math.random();//'depth'
                z: Math.floor(myRand * 100)
                scale: (myRand + 1.0)/2;
                //TODO: Darken based on 'depth'
                width: 132
                height: 132
                //ItemParticle.onAttached: console.log("I'm in"  + x + "," + y + ":" + opacity);
                ItemParticle.onDetached: mp.take(container);//respawns
                function manage()
                {
                    if (state == "selected") {
                        console.log("Taking " + index);
                        mp.freeze(container);
                    } else {
                        console.log("Returning " +index);
                        mp.unfreeze(container);
                    }
                }
                Image {
                    id: img
                    anchors.centerIn: parent
                    antialiasing: true;
                    source: "http://" + Script.getImagePath(content); cache: true
                    fillMode: Image.PreserveAspectFit;
                    width: parent.width-4; height: parent.height-4
                    onStatusChanged: if (img.status == Image.Ready) {
                                         loading.opacity = 0;
                                         mp.take(container);
                                     }
                }
                Text {
                    anchors.bottom: parent.bottom
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    elide: Text.ElideRight
                    text: title
                    color: "black"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: container.state == "selected" ? container.state = "" : container.state = "selected"
                }
                states: State {
                    name: "selected"
                    ParentChange {
                        target: container
                        parent: root
                        x: 0
                        y: 0
                    }
                    PropertyChanges {
                        target: container
                        width: root.width
                        height: root.height
                        z: 101
                        opacity: 1
                        rotation: 0
                    }
                }
                transitions: Transition {
                    to: "selected"
                    reversible: true
                    SequentialAnimation {
                        ScriptAction {script: container.manage();}
                        ParallelAnimation {
                            ParentAnimation {NumberAnimation { properties: "x,y" }}//Doesn't work, particles takes control of x,y instantly
                            NumberAnimation { properties: "width, height, z, rotation" }
                        }
                    }
                }
            }
        }
    }
}
