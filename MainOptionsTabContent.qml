import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Item {
    id: item1
    ColumnLayout {
        width : 600
        anchors.top: parent.top
        anchors.topMargin: 5
        Grid {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            rows: 7
            columns : 2
            spacing : 5

            CheckBox {
                objectName: "-t"
//                text: qsTr("Сохранять время") + rootItem.emptyString
                text: qsTr("Preserve time") + rootItem.emptyString
                checked: true
            }

            CheckBox {
                objectName: "-p"
//                text: qsTr("Сохранять права доступа")
                text: qsTr("Preserve permissions") + rootItem.emptyString
            }

            CheckBox {
                objectName: "-o"
//                text: qsTr("Сохранять владельца как есть")
                text: qsTr("Preserve owner") + rootItem.emptyString
            }

            CheckBox {
                objectName: "-g"
//                text: qsTr("Сохранять группы как есть")
                text: qsTr("Preserve group") + rootItem.emptyString
            }

            CheckBox {
                objectName: "--delete"
//                text: qsTr("Удалить на приемнике")
                text: qsTr("Delete on destination") + rootItem.emptyString
            }

            CheckBox {
                objectName: "-x"
//                text: qsTr("Не покидать файловую систему")
                text: qsTr("Do not leave filesystem") + rootItem.emptyString
            }

            CheckBox {
                objectName: "-v"
//                text: qsTr("Подробно")
                text: qsTr("Verbose") + rootItem.emptyString
                checked: true
            }

            CheckBox {
                objectName: "--progress"
//                text: qsTr("Показывать ход передачи")
                text: qsTr("Show transfer progress") + rootItem.emptyString
                checked: true
            }

            CheckBox {
                objectName: "--ignore-existing"
//                text: qsTr("Игнорировать существующие")
                text: qsTr("Ignore existing") + rootItem.emptyString
            }

            CheckBox {
                objectName: "--size-only"
//                text: qsTr("Только размер")
                text: qsTr("Size only") + rootItem.emptyString
            }

            CheckBox {
                objectName: "-u"
//                text: qsTr("Пропускать более новые")
                text: qsTr("Skip newer") + rootItem.emptyString
            }

            CheckBox {
                objectName: "--modify-window=NUM"
//                text: qsTr("Совместимость с windows")
                text: qsTr("Windows compatibility") + rootItem.emptyString
                enabled: false
            }

            CheckBox {
                objectName: "-n"
                text: qsTr("Simulation run") + rootItem.emptyString
            }

        }
    }
}
