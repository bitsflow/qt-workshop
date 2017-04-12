import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    title: qsTr("Model View")
    id: root
    width: 400; height: 400
    visible: true
    color: "gray"

    // Define a delegate component.  A delegate will be
    // instantiated for each visible item in the list.
    Component {
        id: delegate
        Item {
            id: wrapper; width: parent.width; height: 40
            Column {
                x: 5; y: 5
                Text { text: '<b>Name:</b> ' + name }
                Text { text: '<b>Number:</b> ' + number }
            }
        }
    }

    // You can also define a highlight component. Just one of these will be
    // instantiated by the view to highlight the current item.
    Component {
        id: highlight
        Rectangle {
            color: "lightsteelblue"
            radius: 5
        }
    }

    // The actual list
    ListView {
        cacheBuffer: 200
        clip: true
        anchors.fill: parent
        model: MyModel{ } 	// Refers to MyModel.qml
        delegate: delegate 	// Refers to the delegate component
        highlight: highlight 	// Refers to the highlight component
        focus: true
    }
}
