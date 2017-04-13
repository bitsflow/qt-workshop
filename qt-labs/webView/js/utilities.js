.pragma library

var component, parentElement, theObject

function createObject(fileName, parent) {
    parentElement = parent;
    component = Qt.createComponent("PhotoShooter.qml");
    if (component.status === Component.Ready)
        finishCreation();
    else
        component.statusChanged.connect(finishCreation);
}

function finishCreation() {
    if (component.status === Component.Ready) {
        theObject = component.createObject(parentElement);
        if (theObject === null) {
        } else {// Error Handling
        } // Success, additional steps if needed
    } else if (component.status === Component.Error) { // Error Handling
    }
}

function sizeStringFromFile(fileData) {
    var str = [];
    if (fileData && fileData.fileSize) {
        str.push(fileData.fileSize);
    }
    return str.join("");
}

function doubleDigitNumber(number) {
    if (number < 10)
        return "0" + number;
    return number;
}

function timeStringFromFile(fileData) {
    var str = [];
    if (fileData && fileData.createdAt) {
        var date = new Date(fileData.createdAt);
        if (date) {
            str.push(date.toDateString());
            str.push(" ");
            str.push(doubleDigitNumber(date.getHours()));
            str.push(":");
            str.push(doubleDigitNumber(date.getMinutes()));
        }
    }
    return str.join("");
}
