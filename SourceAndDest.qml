import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2


Item {
    property var pressedButton;
    height : 16
    ColumnLayout {
        width : parent.width
        Text {
            text: "Источник и назначение"
            font.bold: true
        }

        Grid {
            id: grid
            columns: 2
            spacing : 5
            width : parent.width

            TextField {
                id: source
                width : 380
                objectName: "source"
                placeholderText: "Источник"
            }

            Button {
                id : openButtonSource
                text: "Открыть"
                width : 100
                onClicked: {
                    pressedButton = 1;
                    //appCore.runAction()
                    fileDialogLoad.open()
                }

            }

            TextField {
                id: destination
                width : 380
                objectName: "destination"
                placeholderText: "Назначение"
            }

            Button {
                id : openButtonDestination
                width : 100
                text: "Открыть"
                onClicked: {
                    pressedButton = 2;
                    fileDialogLoad.open()
                }

            }
        }
    }

    FileDialog {
        id: fileDialogLoad
        folder: "."
        selectFolder: true
        title: "Choose a file to open"
        selectMultiple: false

        onAccepted: {
            var path = fileDialogLoad.fileUrl.toString();
            // remove prefixed "file://"
            path = path.replace(/^(file:\/{2})|(qrc:\/{2})|(http:\/{2})/,"");
            // unescape html codes like '%23' for '#'
            var cleanPath = decodeURIComponent(path);
            console.log(cleanPath)
            if (pressedButton === 1) {
                source.text = cleanPath;
            } else {
                destination.text = cleanPath;
            }
        }
    }
}
