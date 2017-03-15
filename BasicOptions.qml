import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.3

Item {
    id: item1
    anchors.fill: parent

    ColumnLayout {
        spacing: 5
        anchors.fill: parent



        Row {
            id: row1
            width: 200
            height: 400
            Layout.columnSpan: 2
            layoutDirection: Qt.LeftToRight
            transformOrigin: Item.Center
            Layout.rowSpan: 1
            Layout.fillHeight: true
            Layout.fillWidth: true

            GroupBox {
                id: groupBox1
                y: 2
                height: 300
                title: qsTr("Источник и назначение")
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                antialiasing: false
                flat: false

                ColumnLayout {
                    id: columnLayout1
                    width: 100
                    height: 100

                    Row {
                        id: row3
                        width: 200
                        height: 400
                        spacing: 0

                        Label {
                            id: label1
                            text: qsTr("Label")
                        }

                        TextField {
                            id: textField1
                            placeholderText: qsTr("Text Field")
                        }

                        Button {
                            id: button1
                            text: qsTr("Button")
                        }
                    }

                    Row {
                        id: row4
                        width: 200
                        height: 400

                        Label {
                            id: label2
                            text: qsTr("Label")
                        }

                        TextField {
                            id: textField2
                            placeholderText: qsTr("Text Field")
                        }


                        Button {
                            id: button2
                            text: qsTr("Button")
                        }
                    }

                }
            }

        }

        Row {
            id: row2
            y: 0
            width: 200
            height: 400
            Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
            spacing: 0
            Layout.columnSpan: 1
            Layout.rowSpan: 1
            Layout.fillHeight: false
            Layout.fillWidth: true

            GridView {
                id: gridView1
                x: 0
                y: 0
                width: 140
                height: 140
                flow: GridView.FlowLeftToRight
                maximumFlickVelocity: 2497
                contentHeight: 4
                delegate: Item {
                    x: 5
                    height: 50
                    Column {
                        spacing: 5
                        Rectangle {
                            width: 40
                            height: 40
                            color: colorCode
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                        Text {
                            x: 5
                            text: name
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.bold: true
                        }
                    }
                }
                model: ListModel {
                    ListElement {
                        name: "Grey"
                        colorCode: "grey"
                    }

                    ListElement {
                        name: "Red"
                        colorCode: "red"
                    }

                    ListElement {
                        name: "Blue"
                        colorCode: "blue"
                    }

                    ListElement {
                        name: "Green"
                        colorCode: "green"
                    }
                }
                cellHeight: 70
                cellWidth: 69

                CheckBox {
                    id: checkBox1
                    text: qsTr("Check Box")
                }

                CheckBox {
                    id: checkBox2
                    x: 160
                    y: 8
                    text: qsTr("Check Box")
                }

                CheckBox {
                    id: checkBox3
                    text: qsTr("Check Box")
                }

                CheckBox {
                    id: checkBox4
                    text: qsTr("Check Box")
                }

                CheckBox {
                    id: checkBox5
                    text: qsTr("Check Box")
                }

                CheckBox {
                    id: checkBox6
                    text: qsTr("Check Box")
                }

                CheckBox {
                    id: checkBox7
                    text: qsTr("Check Box")
                }

                CheckBox {
                    id: checkBox8
                    text: qsTr("Check Box")
                }
            }
        }
    }
}
