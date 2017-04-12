var component
var parentElement
var theObject

function createObject(parent) {
     parentElement = parent;
     component = Qt.createComponent("MySubRect.qml");
     if (component.status === Component.Ready)
         finishCreation();
     else
         component.statusChanged.connect(finishCreation);
 }


 function finishCreation() {
     if (component.status === Component.Ready) {
         theObject = component.createObject(parentElement);
         if (theObject === null) {
            // Error Handling
         } else {
            // Success, additional steps if needed
            // theObject.x = 70;
            // theObject.y = 10;
            // ...
         }
     } else if (component.status === Component.Error) {
         // Error Handling
         console.log("Error loading component:", component.errorString());
     }
 }
