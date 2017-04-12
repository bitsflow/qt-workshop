import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("States")
    id: root
    width: 300; height: 400
    visible: true
    color: "black"

    Item {
        anchors.fill: parent

        Rectangle {
            id: view1
            color: "red"
            width: parent.width
            height: parent.height
        }

        Rectangle {
            id: view2
            color: "blue"
            width: parent.width
            height: parent.height
            x: parent.width
        }

        MouseArea {
            id: myMouse
            anchors.fill: parent
            /*    You can use this or the "when" property of a state to trigger
          the state transition:
         onClicked: {
             if (mainRect.state == "inView2")
                 mainRect.state = ""
             else
                 mainRect.state = "inView2"
         } */
        }

        states: [
            State {
                name: "inView2"
                when: myMouse.pressed
                PropertyChanges {
                    target: view1
                    x: -root.width

                }
                PropertyChanges {
                    target: view2
                    x: 0
                }
            }
        ]

        transitions: [
            Transition {
                from: ""
                to: "inView2"
                NumberAnimation { properties: "x"; easing.type: Easing.OutBounce; duration: 1500 }
            },
            Transition {
                from: "inView2"
                to: ""
                NumberAnimation { properties: "x"; easing.type: Easing.OutBounce; duration: 1500 }
            }
        ]
        /*
     The example above could be simplified by simply saying "from any state to any state, always
     run this animation":
     transitions: [
         Transition {
             from: "*"   // These are actually default values, could be left out altogether!
             to: "*"
             NumberAnimation { properties: "x"; easing.type: Easing.OutBounce; duration: 1500 }
         }
     ]
     */

        /*
     What do you think happens if you use this instead? Why? Try for yourself!
     transitions: [
         Transition {
             from: ""
             to: "inView2"
             reversible: true
             NumberAnimation { properties: "x"; easing.type: Easing.OutBounce; duration: 1500 }
         }
     ]
     */
    }
}
