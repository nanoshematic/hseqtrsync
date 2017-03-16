import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Item {
    ColumnLayout {
        Layout.fillWidth: true
        width: 600
        anchors.top: parent.top
        anchors.topMargin: 5
        Grid {
            rows: 6
            columns : 1
            spacing : 5

            CheckBox{
                objectName: "runBef"
                text: qsTr("Run comand before start rsync ") + rootItem.emptyString
            }


            TextField {
                objectName: "comBef"
                width: 590
            }

            CheckBox{
                objectName: "errBef"
                text: qsTr("Stop exicution if error founds") + rootItem.emptyString
            }



            CheckBox{
                objectName: "runAft"
                text: qsTr("Run comand after start rsync ") + rootItem.emptyString
            }


            TextField {
                objectName: "comAft"
                width: 590
            }

            CheckBox{
                objectName: "errAft"
                text: qsTr("Start only if rsync crashes") + rootItem.emptyString
            }
        }
        Grid {
            rows: 1
            columns : 2
            spacing : 5

            CheckBox{
                objectName: "syncFiles"
                text: qsTr("Sync files instead of directories") + rootItem.emptyString
                onClicked: appCore.cbClicked();
            }



            CheckBox{

                objectName: "startAsRoot"
                text: qsTr("Start as root") + rootItem.emptyString

            }
        }
    }
}
