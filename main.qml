import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2

ApplicationWindow {
    //height: 470
    Connections {
        target: appCore // Указываем целевое соединение
        /* Объявляем и реализуем функцию, как параметрe
             * объекта и с именем похожим на название сигнала
             * Разница в том, что добавляем в начале on и далее пишем
             * с заглавной буквы
             * */
        onSendConsoleOutput: {
            ta.append(output)
        }
    }
    
    visible: true
    minimumWidth : 600
    minimumHeight : 480
    maximumWidth: 600
    maximumHeight: 480
    
    menuBar: MenuBar {
        
        Menu {
            title:  qsTr("Settings") + rootItem.emptyString
            MenuItem {
                text: qsTr("Save") + rootItem.emptyString
                onTriggered: appCore.saveSettings()
            }
            MenuItem {
                text: qsTr("Load") + rootItem.emptyString
                onTriggered: appCore.loadSettings()
            }
        }
        Menu {
            title: qsTr("Language") + rootItem.emptyString
            MenuItem {
                text : "Ru: Русский"
                onTriggered: rootItem.selectLanguage("ru")
            }
            MenuItem {
                text : "En: English"
                onTriggered: rootItem.selectLanguage("en")
            }
        }
    }
    
    ColumnLayout {
        //Отступ между элементами (кнопками)
        //spacing: 5
        
        //Наш ColumnLayout будет вписан в
        //окно приложения с отступами по 5
        //со всех сторон
        anchors.fill: parent
        anchors.margins: 5
        width : parent.width
        height: parent.height
        anchors.topMargin: 5
        
        RowLayout {
            id: rowLayout
            width: 630
            height: 30
            
            
            ComboBox {
                id: cbbSession
                width: 400
                height: 30
                Layout.preferredHeight: 30
                Layout.preferredWidth: 400
                editable: true
                model: ListModel  {
                    id: model
                    ListElement { text: "default"; color: "Black" }
                }
                onAccepted: {
                    if (find(currentText) === -1) {
                        model.append({text: editText})
                        currentIndex = find(editText)
                        appCore.addSession(currentText)
                    }
                }
            }

            Button {
                id: btnDeleteSession
                text: qsTr("Delete") + rootItem.emptyString
                onClicked: appCore.deleteSession()
            }
        }
        
        SourceAndDest {
            width : 590
            height: 100
            Layout.minimumHeight: 80
            Layout.minimumWidth: 590
            Layout.maximumHeight: 80
            Layout.maximumWidth: 590
        }
        
        OptionsTab {
            y: 94
            width : 590
            height: 200
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.maximumHeight: 200
            Layout.maximumWidth: 590
            Layout.minimumHeight: 200
            Layout.minimumWidth: 590
        }
        
        Button {
            id : runRsync
            y: 250
            width: 100
            height: 30
            text : qsTr("Run") + rootItem.emptyString
            onClicked: {
                ta.text = "";
                appCore.runAction();
                
            }
        }
        
        TextArea {
            id: ta
            y: 310
            objectName: "rsyncOut"
            width: 590
            height: 150
            text: ""
            Layout.maximumHeight: 100
            Layout.maximumWidth: 590
            Layout.minimumHeight: 100
            Layout.minimumWidth: 590
            Layout.preferredHeight: 100
            Layout.preferredWidth: 590
        }
        
        
        
    }
    
    
}



