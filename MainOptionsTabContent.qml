import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Item {
    ColumnLayout {
        width : 600
        Grid {
            columns : 2
            spacing : 4

            CheckBox {
                objectName: "-t"
                text: qsTr("Сохранять время")
            }

            CheckBox {
                objectName: "-p"
                text: qsTr("Сохранять права доступа")
            }

            CheckBox {
                objectName: "-o"
                text: qsTr("Сохранять владельца как есть")
            }

            CheckBox {
                objectName: "-g"
                text: qsTr("Сохранять группы как есть")
            }

            CheckBox {
                objectName: "--delete"
                text: qsTr("Удалить на приемнике")
            }

            CheckBox {
                objectName: "-x"
                text: qsTr("Не покидать файловую систему")
            }

            CheckBox {
                objectName: "-v"
                text: qsTr("Подробно")
            }

            CheckBox {
                objectName: "--progress"
                text: qsTr("Показывать ход передачи")
            }

            CheckBox {
                objectName: "--ignore-existing"
                text: qsTr("Игнорировать существующие")
            }

            CheckBox {
                objectName: "--size-only"
                text: qsTr("Только размер")
            }

            CheckBox {
                objectName: "-u"
                text: qsTr("Пропускать более новые")
            }

            CheckBox {
                objectName: "--modify-window=NUM"
                text: qsTr("Совместимость с windows")
            }



        }
    }
}
