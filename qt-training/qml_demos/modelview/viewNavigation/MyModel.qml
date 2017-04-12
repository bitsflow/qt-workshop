import QtQuick 2.4

// Note!
// ----------
// If you have some dummy test data/model like this during development, you might
// want to place that kind of files into a special subfolder called "dummydata" under
// the root of your project.
//
// This enables the qmlviewer.exe to find and load such files automatically,
// so that you do not need to import them in your other .qml files.
//
// This way you do not need to modify your .qml files by removing any unnecessary
// import statements for test data files when you release your project - just remove
// the whole dummydata folder!

ListModel {
    id: contactModel
    ListElement {
        name: "Bill Smith"
        number: "555 3264"
    }
    ListElement {
        name: "John Brown"
        number: "555 8426"
    }
    ListElement {
        name: "Sam Wise"
        number: "555 0473"
    }
}
