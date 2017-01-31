import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Item {
    width : 600
    ColumnLayout {
        height : 300
        width : 600
        TabView {
            id: bar
            width: 600
            Tab {
                width : 600
                title: qsTr("Основные опции")
                Item {
                    id: homeTab
                    MainOptionsTabContent {

                    }
                }
            }
            Tab {
                title: qsTr("Расширенные опции")
            }
            Tab {
                title: qsTr("Дополнительные опции")
            }
        }

//        StackLayout {
//            width: parent.width
//            currentIndex: bar.currentIndex
//            Item {
//                id: homeTab
//                TextField {
//                    id: field212
//                    objectName: "field212"
//                    placeholderText: "Введите 121 число"
//                    width: 700
//                }
//            }
//            Item {
//                id: discoverTab
//            }
//            Item {
//                id: activityTab
//            }
//        }
    }
}
