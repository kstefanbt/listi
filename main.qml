import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4

Window {
    Text{
        anchors.bottom:parent.bottom
id:t1
        text:"x"
        visible: false
    }
    Text{
        anchors.bottom:parent.bottom
id:t2
        text:"y"
        visible: false
    }
    width: 640
    height: 480

    visible: true
    Rectangle{

        id: buttons
        visible: true
        width: 350
        height: 70
        radius: 30
        color: "lightGrey"
        anchors.left: parent.left
        anchors.top: parent.top
        Image{
            id: image1
            anchors.left:parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 10
            source: database.getPath() + "myLists.gif"
        }
        Text{
            id: myLists
            anchors.left: image1.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            text: "My Lists"
            font.bold: true
            font.pointSize: 27

        }
        Rectangle{
            id:b1
            anchors.left: myLists.right
            anchors.verticalCenter: parent.verticalCenter
            width:100
            height: 20
        Text{
            id: createNew
            anchors.fill: parent
            width:80
            text: "Create a new list"
            color: "red"
            font.underline: true
            font.pointSize: 10
            MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        b1.color = cg1.text
                        createNew.color = cg2.text
                        cg3.text = cg1.text
                        cg1.text = cg2.text
                        cg2.text = cg3.text
                    }
                    onClicked: {
                        buttons.visible = !buttons.visible
                        buttons2.visible = !buttons2.visible
                        create.visible = !create.visible
                        lists.visible =! lists.visible
                        listsC.visible =!listsC.visible
                    }

                }
        }
        }
    }

    Rectangle{
        id: lists
        width: 400
        height: 200
        visible: true
        anchors.top: buttons.bottom
        anchors.left: parent.left
        anchors.margins: 10


        Text {
            id: text1
            anchors.top:parent.top
            anchors.left: parent.left
            text: qsTr("MyLists")
            font.pixelSize: 12
            }
        ListView {
            anchors.left:parent.left
            anchors.top: text1.bottom
            id: listView1

            width: 400
            height: 200
            delegate: Item {
            id: delegate
            width: delegate.ListView.view.width;
            height: 30
            clip: true
            anchors.margins: 4
            Row {
                anchors.margins: 4

                spacing: 4;
                Text {
                    visible: false
                    text: id
                    font.pointSize: 10
                    width: 50
                    anchors.top: parent.top
                }
                Text {
                    text: "."
                    font.pointSize: 10
                    width: 5
                    anchors.top: parent.top
                }

                Rectangle{
                    id: back

                    width: 60
                    height: 20
                Text {
                    id:n1
                    text: name
                    width: 50
                    font.underline: true
                    font.bold: true
                    color: "blue"
                    MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: {
                                listView1.focus = true
                                t1.text = n1.text
                                database.updateTableShow(t1.text)
                                Model2.updateModel();
                                Model3.updateModel();
                                Model5.updateModel();
                                Model6.updateModel();
                                lists.visible = !lists.visible
                                buttons.visible = !buttons.visible
                                buttons3.visible =!buttons3.visible
                                listsE.visible = !listsE.visible
                                addNewE.visible =!addNewE.visible
                                listsE2.visible = !listsE2.visible
                                listsC.visible =!listsC.visible
                            }
                            onHoveredChanged: {
                                back.color = y1.text
                                n1.color = y2.text
                                y3.text = y1.text
                                y1.text = y2.text
                                y2.text = y3.text
                            }
                        }
                    }

                }


                Text {
                    text: " - "
                    width: 10;
                    color: "grey"
                }
                Text {
                    text: lefti
                    width: 5;
                    color: "grey"
                }
                Text {
                    text: "left"
                    width: 50;
                    color: "grey"
                }

            }
}
                model: Model1

}}

    Rectangle{
        id: listsC
        width: 400
        height: 200
        visible: true
        anchors.top: lists.bottom
        anchors.left: parent.left
        Text {
            id: textC
            anchors.top:parent.top
            anchors.left: parent.left
            text: qsTr("Completed lists:   ")
            font.pixelSize: 12
            }
        ListView {
            anchors.top: parent.top
            anchors.left: textC.right
            id: listView2
            orientation: Qt.Horizontal
            width: 200
            height: 200
            delegate: Item {
            id: delegateC
            width: 30
            height: 30
            clip: true
            anchors.margins: 4
            Row {
                anchors.margins: 4

                spacing: 4;
                Rectangle{
                    id: backC

                    width: 20
                    height: 20
                Text {
                    id:nC
                    text: name
                    width: 20
                    font.underline: true
                    color: "blue"
                    MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: {
                                listView1.focus = true
                                t1.text = nC.text
                                database.updateTableShow(t1.text)
                                Model2.updateModel();
                                Model3.updateModel();
                                Model5.updateModel();
                                Model6.updateModel();
                                lists.visible = !lists.visible
                                buttons.visible = !buttons.visible
                                buttons3.visible =!buttons3.visible
                                listsE.visible = !listsE.visible
                                addNewE.visible =!addNewE.visible
                                listsE2.visible = !listsE2.visible
                                listsC.visible =!listsC.visible
                            }
                            onHoveredChanged: {
                                backC.color = y1.text
                                nC.color = y2.text
                                y3.text = y1.text
                                y1.text = y2.text
                                y2.text = y3.text
                            }
                        }
                    }
                Text{
                    width: 10
                    text: ", "
                    anchors.left: nC.right
                }

                }
            }
}
                model: Model4

}}

    Rectangle{
        id: buttons2
        visible: false
        width: 350
        height: 70
        radius: 30
        color: "lightGrey"
        anchors.left: parent.left
        anchors.top: parent.top
        Image{
            id: image2
            anchors.left:parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 10
            source: database.getPath() + "myLists.gif"
        }

        Rectangle{
            id:b2
            anchors.left: image2.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            width:100
            height: 20
        Text{
            id: myLists2
            anchors.fill:parent

            text: "My Lists"
            color: "blue"
            font.underline: true
            font.pointSize: 12
            MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        b2.color = z1.text
                        myLists2.color = z2.text
                        z3.text = z1.text
                        z1.text = z2.text
                        z2.text = z3.text
                    }
                    onClicked: {
                        buttons.visible = !buttons.visible
                        buttons2.visible = !buttons2.visible
                        create.visible = !create.visible
                        lists.visible =! lists.visible
                        listsC.visible =!listsC.visible
                    }
                }
        }
        }
    }

    Rectangle{
        id: create
        visible: false
        width: 640
        height: 400
        radius: 30

        anchors.left: parent.left
        anchors.top: buttons2.bottom
        Text{
            id: name
            anchors.left: parent.left
            anchors.top: parent.top
            text: "Name your new list"
            color: "black"
            font.bold: true
            font.pointSize: 12

        }
        TextField{
            id: in1
            anchors.left: parent.left
            anchors.top: name.bottom
            width: 600
            height:40
            text: ""
        }
        Button{
            id: button
            anchors.left: parent.left
            anchors.top: in1.bottom
            text: "Create this list"
            style: ButtonStyle {
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 25
                        border.width: control.activeFocus ? 2 : 1
                        border.color: "blue"
                        radius: 15
                        gradient: Gradient {
                            GradientStop { position: 0 ; color: control.pressed ? "lightBlue" : "lightBlue" }
                            GradientStop { position: 1 ; color: control.pressed ? "lightBlue" : "lightBlue" }
                        }
                    }
            }
            onClicked: {
                database.insertIntoTableL(listView1.count+listView2.count,in1.text)
                Model1.updateModel();
                Model2.updateModel();
                Model3.updateModel();
                Model4.updateModel();
                Model5.updateModel();
                Model6.updateModel();
                buttons.visible = !buttons.visible
                buttons2.visible = !buttons2.visible
                create.visible = !create.visible
                lists.visible =! lists.visible
                listsC.visible =!listsC.visible
            }
        }
        Text{
            id: or
            anchors.left: button.right
            anchors.top: in1.bottom
            anchors.margins: 10
            text:"or"
        }
        Rectangle{
            id:b3
            anchors.left: or.right
            anchors.top: in1.bottom
            width:100
            height: 20
        Text{
            id: cancel1
            anchors.fill: parent
            text: "Cancel"
            color: "red"
            font.underline: true
            font.pointSize: 10
            MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        b3.color = c1.text
                        cancel1.color = c2.text
                        c3.text = c1.text
                        c1.text = c2.text
                        c2.text = c3.text
                    }
                    onClicked: {
                        buttons.visible = !buttons.visible
                        buttons2.visible = !buttons2.visible
                        create.visible = !create.visible
                        lists.visible = !lists.visible
                        listsC.visible =!listsC.visible
                    }
                }
        }
        }
    }

    Rectangle{
        id: buttons3
        visible: false
        width: 350
        height: 70
        radius: 30
        color: "lightGrey"
        anchors.left: parent.left
        anchors.top: parent.top
        Image{
            id: image3
            anchors.left:parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 10
            source: database.getPath() + "myLists.gif"
        }
        Rectangle{
            id:b4
            anchors.left: image3.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            width:100
            height: 20
        Text{
            id: myLists3
            anchors.fill:parent
            text: "My Lists"
            color: "blue"
            font.underline: true
            font.pointSize: 12
            MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        b4.color = z1.text
                        myLists3.color = z2.text
                        z3.text = z1.text
                        z1.text = z2.text
                        z2.text = z3.text
                    }
                    onClicked: {
                        lists.visible = !lists.visible
                        buttons.visible = !buttons.visible
                        buttons3.visible =!buttons3.visible
                        listsE.visible = !listsE.visible
                        addNewE.visible = false
                        listsE2.visible = !listsE2.visible
                        addNew.visible = false
                        listsC.visible =!listsC.visible
                    }
                }
        }
        }
        Rectangle{
            id:b5
            anchors.left: b4.right
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            width:100
            height: 20
        Text{
            id: ed
            text: "Edit this list"
            color: "red"
            font.underline: true
            anchors.fill: parent
            MouseArea{
                anchors.fill:parent
                hoverEnabled: true
                onHoveredChanged: {
                    b5.color = cg1.text
                    ed.color = cg2.text
                    cg3.text = cg1.text
                    cg1.text = cg2.text
                    cg2.text = cg3.text
                }
                onClicked: {
                    buttons3.visible = false
                    listsE.visible = !listsE.visible
                    addNewE.visible = false
                    addNew.visible = false
                    listsE2.visible = !listsE2.visible
                    edit.visible = !edit.visible

                }
            }

        }
        }
    }

    Rectangle{
        id: listsE
        width: 400
        height:100
        visible: false
        anchors.top: buttons.bottom
        anchors.left: parent.left
        anchors.margins: 10
        Text {
            id: text2
            anchors.top:parent.top
            anchors.left: parent.left
            text: t1.text
            font.pixelSize: 16
            font.bold: true
            }
        ListView {
            anchors.left:parent.left
            anchors.top: text2.bottom
            anchors.margins: 10
            id: listViewE1

            width: 400
            height: 100
            delegate: Item {
            id: delegate2
            width: delegate2.ListView.view.width;
            height: 30
            clip: true
            anchors.margins: 4
            Row {
                anchors.margins: 4

                spacing: 4;

                CheckBox{
                    checked: false
                    onClicked: {
                        t2.text = n2.text
                        database.updateTableE1(t2.text)
                        database.updateTableLC1();
                        Model1.updateModel();
                        Model4.updateModel();
                        Model3.updateModel();
                        Model2.updateModel();
                        Model5.updateModel();
                        Model6.updateModel();
                    }
                }
                Text {
                    id:n2
                    text: name
                    width: 50
//                    MouseArea {
//                            anchors.fill: parent
//                            hoverEnabled: true
//                            onClicked: {
//                                listView1.focus = true
//                                t1.text = n1.text
//                                database.updateTableShow(t1.text)
//                                lists.visible = !lists.visible
//                                buttons.visible = !buttons.visible
//                                buttons3.visible =!buttons3.visible
//                            }

//                        }
                    }
                }
            }
                   model: Model2
}
}

    Rectangle{
        id: addNewE
        visible: false
        width: 120
        height: 30
        anchors.left: parent.left
        anchors.top: listsE.bottom
        anchors.leftMargin: 40
        anchors.topMargin: 10

        Text{
            id: addE

            anchors.fill: parent

            text: "Add another item"
            color: "red"
            font.underline: true
            font.pointSize: 10
//            MouseArea {
//                    anchors.fill: parent
//                    onClicked: {

//                    }
//                }
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true

            onHoveredChanged: {

                addNewE.color = c1.text
                addE.color = c2.text
                c3.text = c1.text
                c1.text = c2.text
                c2.text = c3.text
            }
            onClicked: {
                addNewE.visible = !addNewE.visible
                addNew.visible = !addNew.visible
            }
        }
    }

    Rectangle{
        id: addNew
        visible: false
        width: 400
        height: 120
        radius: 30

        anchors.left: parent.left
        anchors.top: listsE.bottom

        TextField{
            id: in2
            anchors.left: parent.left
            anchors.top: parent.top
            width: 600
            height:40
            text: ""
        }
        Button{
            id: button2
            anchors.left: parent.left
            anchors.top: in2.bottom
            text: "+ Add this item"
            style: ButtonStyle {
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 25
                        border.width: control.activeFocus ? 2 : 1
                        border.color: "blue"
                        radius: 15
                        gradient: Gradient {
                            GradientStop { position: 0 ; color: control.pressed ? "lightBlue" : "lightBlue" }
                            GradientStop { position: 1 ; color: control.pressed ? "lightBlue" : "lightBlue" }
                        }
                    }
            }
            onClicked: {
                database.insertIntoTableE((listViewE1.count+listViewE2.count).toString() ,in2.text)
                database.updateTableE3()
                database.updateTableLC2();
                Model1.updateModel();
                Model4.updateModel();
                Model2.updateModel();
                Model3.updateModel();
                Model5.updateModel();
                Model6.updateModel();
                addNewE.visible = !addNewE.visible
                addNew.visible = !addNew.visible
            }
        }

        Text{
            id: cancel2
            anchors.left: button2.right
            anchors.top: in2.bottom
            anchors.margins: 10
            text: "Cancel"
            color: "red"
            font.underline: true
            font.pointSize: 10
            MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        addNewE.visible = !addNewE.visible
                        addNew.visible = !addNew.visible
                    }
                }
        }
    }

    Rectangle{
        id: listsE2
        width: 400
        height:100
        visible: false
        anchors.top: addNew.bottom
        anchors.left: parent.left
        anchors.margins: 10
        ListView {
            anchors.left:parent.left
            anchors.top: parent.top
            anchors.margins: 10
            id: listViewE2

            width: 400
            height: 200
            delegate: Item {
            id: delegate3
            width: delegate3.ListView.view.width;
            height: 30
            clip: true
            anchors.margins: 4
            Row {
                anchors.margins: 4

                spacing: 4;

                CheckBox{
                    checked: true
                    onClicked: {
                        t2.text = n3.text
                        database.updateTableE2(t2.text)
                        database.updateTableLC2();
                        Model1.updateModel();
                        Model4.updateModel();
                        Model2.updateModel();
                        Model3.updateModel();
                        Model5.updateModel();
                        Model6.updateModel();
                    }
                }
                Text {
                    id:n3
                    text: name
                    width: 50
//                    MouseArea {
//                            anchors.fill: parent
//                            hoverEnabled: true
//                            onClicked: {
//                                listView1.focus = true
//                                t1.text = n1.text
//                                database.updateTableShow(t1.text)
//                                lists.visible = !lists.visible
//                                buttons.visible = !buttons.visible
//                                buttons3.visible =!buttons3.visible
//                            }

//                        }
                    }


                }
            }
                   model: Model3
}
}

    Rectangle{
        id: edit
        width: 400
        height: 200
        visible: false
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 10
        Text {
            id: e1
            anchors.top:parent.top
            anchors.left: parent.left
            text: qsTr("Edit this list")
            font.pixelSize: 12
            }
        Rectangle{
            id:b6
            anchors.top: e1.bottom
            anchors.left:parent.left
            width:100
            height: 20
        Text{
            id: cancelE
            anchors.fill: parent
            text: "Cancel"
            color: "red"
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    b6.color = c1.text
                    cancelE.color = c2.text
                    c3.text = c1.text
                    c1.text = c2.text
                    c2.text = c3.text
                }
                onClicked: {
                    buttons3.visible = !buttons3.visible
                    listsE.visible = !listsE.visible
                    addNewE.visible = true
                    addNew.visible = false
                    listsE2.visible = !listsE2.visible
                    edit.visible = !edit.visible
                }
            }
        }
        }
        Rectangle{
            id:b7
            anchors.top: e1.bottom
            anchors.left:b6.right
            anchors.leftMargin: 5
            width:100
            height: 20
        Text{
            id: deleteE
            anchors.fill: parent
            text: "Delete this list"
            color: "red"
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: {
                    b7.color = c1.text
                    deleteE.color = c2.text
                    c3.text = c1.text
                    c1.text = c2.text
                    c2.text = c3.text
                }
                onClicked: {
                    database.removeRecord2();
                    database.removeRecord();
                    Model1.updateModel();
                    Model4.updateModel();Model6.updateModel();
                    buttons.visible = !buttons.visible
                    lists.visible =! lists.visible
                    listsC.visible =!listsC.visible
                    edit.visible = !edit.visible
                }
            }
        }
        }
        ListView {
            anchors.left:parent.left
            anchors.top: b7.bottom
            anchors.topMargin: 20
            id: listViewEditN

            width: 400
            height: 40
            delegate: Item {
            id: delegateEdit1
            width: delegateEdit1.ListView.view.width;
            height: 30
            clip: true
            anchors.margins: 4
            Row {
                anchors.margins: 4

                spacing: 4;
                Rectangle{
                border.width: 1
                border.color: "black"
                height: 20
                width: 150
                    TextEdit{
                    text: id
                    anchors.fill: parent
                    anchors.leftMargin: 10
                    width: 140

                }
            }
}}
                model: Model5

}
        ListView {
            anchors.left:parent.left
            anchors.top: listViewEditN.bottom
            anchors.topMargin: 20
            id: listViewEdit

            width: 400
            height: 200
            delegate: Item {
            id: delegateEdit2
            width: delegateEdit2.ListView.view.width;
            height: 30
            clip: true
            anchors.margins: 4
            Row {
                anchors.margins: 4

                spacing: 4;
                Rectangle{
                    id:rr
                border.width: 1
                border.color: "black"
                height: 20
                width: 150
                    TextEdit{
                        id:tt
                    text: name
                    anchors.fill: parent
                    anchors.leftMargin: 10
                    width: 140

                }
            }
            Text{
                id: x
                anchors.leftMargin: 4
                color: "grey"
                text: "x"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        database.removeRecord3(tt.text)
                        Model1.updateModel();
                        Model2.updateModel();
                        Model3.updateModel();
                        Model4.updateModel();
                        Model5.updateModel();
                        Model6.updateModel();
                    }
                }
            }
    }}
                model: Model6

    }
        Button{
            id: save
            anchors.left: parent.left
            anchors.top: listViewEdit.bottom
            Text{
                anchors.fill: parent
                text: "Save this list"
                color: "black"
            }
            style: ButtonStyle {
                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 25
                        border.width: control.activeFocus ? 2 : 1
                        border.color: "black"
                        radius: 1
                        gradient: Gradient {
                            GradientStop { position: 0 ; color: control.pressed ? "grey" : "grey" }
                            GradientStop { position: 1 ; color: control.pressed ? "grey" : "grey" }
                        }
                    }
            }
        }
    }



//        ListView {
//            anchors.left:parent.left
//            anchors.top: text1.bottom
//            id: listViewEdit

//            width: 400
//            height: 200
//            delegate: Item {
//            id: delegateEdit2
//            width: delegate.ListView.view.width;
//            height: 30
//            clip: true
//            anchors.margins: 4
//            Row {
//                anchors.margins: 4

//                spacing: 4;
//                Text {
//                    visible: false
//                    text: id
//                    font.pointSize: 10
//                    width: 50
//                    anchors.top: parent.top
//                }
//                Text {
//                    text: "."
//                    font.pointSize: 10
//                    width: 5
//                    anchors.top: parent.top
//                }

//                Rectangle{
//                    id: back

//                    width: 60
//                    height: 20
//                Text {
//                    id:n1
//                    text: name
//                    width: 50
//                    font.underline: true
//                    font.bold: true
//                    color: "blue"
//                    MouseArea {
//                            anchors.fill: parent
//                            hoverEnabled: true
//                            onClicked: {
//                                listView1.focus = true
//                                t1.text = n1.text
//                                database.updateTableShow(t1.text)
//                                Model2.updateModel();
//                                Model3.updateModel();
//                                lists.visible = !lists.visible
//                                buttons.visible = !buttons.visible
//                                buttons3.visible =!buttons3.visible
//                                listsE.visible = !listsE.visible
//                                addNewE.visible =!addNewE.visible
//                                listsE2.visible = !listsE2.visible
//                                listsC.visible =!listsC.visible
//                            }
//                            onHoveredChanged: {
//                                back.color = y1.text
//                                n1.color = y2.text
//                                y3.text = y1.text
//                                y1.text = y2.text
//                                y2.text = y3.text
//                            }
//                        }
//                    }

//                }


//                Text {
//                    text: " - "
//                    width: 10;
//                    color: "grey"
//                }
//                Text {
//                    text: lefti
//                    width: 5;
//                    color: "grey"
//                }
//                Text {
//                    text: "left"
//                    width: 50;
//                    color: "grey"
//                }

//            }
//}
//                model: Model1

//}}

    title: qsTr("myLists")
    Text{
    visible: false
    id: z1
    text:"blue"
    }
    Text{
    visible: false
    id: z2
    text:"lightgrey"
    }
    Text{
    visible: false
    id: z3
    text:""
    }
    Text{
    visible: false
    id: cg1
    text:"red"
    }
    Text{
    visible: false
    id: cg2
    text:"lightgrey"
    }
    Text{
    visible: false
    id: cg3
    text:""
    }
    Text{
    visible: false
    id: c1
    text:"red"
    }
    Text{
    visible: false
    id: c2
    text:"white"
    }
    Text{
    visible: false
    id: c3
    text:""
    }
    Text{
    visible: false
    id: y1
    text:"blue"
    }
    Text{
    visible: false
    id: y2
    text:"white"
    }
    Text{
    visible: false
    id: y3
    text:""
    }
}
