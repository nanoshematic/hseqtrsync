import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2

ApplicationWindow {
    //height: 470
    Connections {
        target: appCore // Указываем целевое соединение
        /* Объявляем и реализуем функцию, как параметр
             * объекта и с именем похожим на название сигнала
             * Разница в том, что добавляем в начале on и далее пишем
             * с заглавной буквы
             * */
        //            onSendToQml: {
        //                labelCount.text = count // Устанавливаем счётчик в текстовый лейбл
        //            }
        onSendConsoleOutput: {
            ta.append(output)
        }
    }

    visible: true
    minimumWidth : 600
    minimumHeight : 480
    maximumWidth: 600
    maximumHeight: 480

//    header : ToolBar {
//                 RowLayout {
//                     anchors.fill: parent
//                     ToolButton {
//                         text: qsTr("⋮")
//                         onClicked: menu.open()
//                     }
//                     Label {
//                         text: "QtRsync"
//                         elide: Label.ElideRight
//                         horizontalAlignment: Qt.AlignHCenter
//                         verticalAlignment: Qt.AlignVCenter
//                         Layout.fillWidth: true
//                     }

//                 }
//             }

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
            height: 300
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.maximumHeight: 150
            Layout.maximumWidth: 590
            Layout.minimumHeight: 150
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

        Button {
            id : runEng
            //y: 250
            width: 100
            height: 30
            text : "English"
            onClicked: {
                rootItem.selectLanguage("en")
            }
        }

        Button {
            id : runRus
            //y: 250
            width: 100
            height: 30
            text : "Русский"
            onClicked: {
                rootItem.selectLanguage("ru")
            }
        }

        TextArea {
            id: ta
            y: 310
            objectName: "rsyncOut"
            width: 590
            height: 150
            text: ""
            Layout.maximumHeight: 150
            Layout.maximumWidth: 590
            Layout.minimumHeight: 150
            Layout.minimumWidth: 590
            Layout.preferredHeight: 150
            Layout.preferredWidth: 590
        }
    }
}



