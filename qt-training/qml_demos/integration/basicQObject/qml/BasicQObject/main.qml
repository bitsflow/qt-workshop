import QtQuick 2.0
import People 1.0

Rectangle {
    width: 360
    height: 200

    // Person is implemented in C++
    Person {
        id: person
        name: "Bob Jones"
        shoeSize: 12
        onNameChanged: {
            console.log("New name: " + name);
        }
    }

    Column {
        anchors.fill:  parent
        spacing: 20
        Text {
            font.bold: true
            font.pixelSize: 26
            text: "Person name: " + person.name
        }
        Text {
            font.bold: true
            font.pixelSize: 26
            text: "Person shoe size: " + person.shoeSize
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            person.name = "John Doe";
        }
    }
}
