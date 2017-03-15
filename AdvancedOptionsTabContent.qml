import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Item {
    id: item1
    ColumnLayout {
        width: 600
        anchors.top: parent.top
        anchors.topMargin: 5
        Grid {
            width: 590
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            rows: 6
            columns : 2
            spacing : 5

            CheckBox {
                objectName: "-c"
                text: qsTr("Always checksum") + rootItem.emptyString
//                text: qsTr("Всегда сверять контрольные суммы") + rootItem.emptyString
            }

            CheckBox {
                objectName: "-z"
//                text: qsTr("Сжимать данные файлов")
                text: qsTr("Compress file data") + rootItem.emptyString

            }

            CheckBox {
                objectName: "-D"
//                text: qsTr("Сохранять устройста как есть")
                text: qsTr("Preserve devices") + rootItem.emptyString

            }

            CheckBox {
                objectName: "--existing"
                text: qsTr("Only update existing files") + rootItem.emptyString
//                text: qsTr("Обновлять только существующие файлы")
            }

            CheckBox {
                objectName: "-P"
                text: qsTr("Keep partially transferred files") + rootItem.emptyString
//                text: qsTr("Сохранять частично переданные файлы")
            }

            CheckBox {
                objectName: "-numeric-ids"
                text: qsTr("Don't map uid/gid values") + rootItem.emptyString
//                text: qsTr("Не переназначать значения uid/gid")
            }

            CheckBox {
                //TODO: Code?
                objectName: "-zzz"
                text: qsTr("Copy symlinks as symlinks") + rootItem.emptyString
//                text: qsTr("Копировать симлинки как симлинки")
            }

            CheckBox {
                objectName: "-H"
                text: qsTr("Copy hardlinks as hardlinks") + rootItem.emptyString
//                text: qsTr("Копировать хардлинки как хардлинки")
            }

            CheckBox {
                objectName: "-b"
                text: qsTr("Make backups") + rootItem.emptyString
//                text: qsTr("Делать резервные копии")
            }

            CheckBox {
                objectName: "-i"
                text: qsTr("Show itemized changes list") + rootItem.emptyString
//                text: qsTr("Показывать детальный список изменений")
            }

            CheckBox {
                objectName: "-zzza"
                text: qsTr("Disable recursion") + rootItem.emptyString
//                text: qsTr("Отключить рекурсию")
            }

            CheckBox {
                objectName: "-s"
                text: qsTr("Protect remote args") + rootItem.emptyString
//                text: qsTr("Автоматически экранировать аргументы")
                checked: true
            }
        }
    }
}
