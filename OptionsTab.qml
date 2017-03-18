import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Item {
    width : 600
    property alias bar: bar
    ColumnLayout {
        anchors.fill: parent
        Layout.fillHeight: true
        Layout.fillWidth: true
        TabView {
            id: bar
            width: 600
            Layout.fillWidth: true
            Layout.fillHeight: true
            Tab {
                id: tab1
                width : 600
                title: qsTr("Main options") + rootItem.emptyString
                Item {
                    id: homeTab
                    MainOptionsTabContent {

                    }
                }
            }
            Tab {
                width : 600
//                title: qsTr("Расширенные опции") + rootItem.emptyString
                title: qsTr("Advanced options") + rootItem.emptyString

                Item {
                    id: advancedTab
                    AdvancedOptionsTabContent {

                    }
                }
            }
            Tab {
                width : 600
                title: qsTr("Extended options") + rootItem.emptyString
//                title: qsTr("Дополнительные опции") + rootItem.emptyString
                Item {
                    id: extendedTab
                    ExtendedOptionsTabContent {

                    }
                }
            }
        }
    }
}
