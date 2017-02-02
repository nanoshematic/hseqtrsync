import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2

ApplicationWindow {
    Connections {
            target: appCore // Указываем целевое соединение
            /* Объявляем и реализуем функцию, как параметр
             * объекта и с имененем похожим на название сигнала
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
    minimumHeight : 500

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
            spacing: 5

            //Наш ColumnLayout будет вписан в
            //окно приложения с отступами по 5
            //со всех сторон
            anchors.fill: parent
            anchors.margins: 5
            width : parent.width

            SourceAndDest {
                width : parent.width
            }

            OptionsTab {
                width : 600
                height : 300
            }

            Button {
                id : runRsync
                text : "Запустить"
                onClicked: {
                    ta.text = "";
                    appCore.runAction();
                }
            }


            TextField {
                id: field2
                objectName: "field2"
                placeholderText: "Введите второе число"
                width: 700
            }

            TextArea {
                id: ta
                objectName: "rsyncOut"
                width: 240
                text: ""
            }



        }


}


