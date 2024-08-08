import QtQuick 2.15

Rectangle {
    id: navSearchBox
    radius:5

    color: "#f0f0f0"

    Image {
        id: searchIcon

        anchors {
            left: parent.left
            leftMargin: 25
            verticalCenter: parent.verticalCenter
        }

        height: parent.height * 0.45
        fillMode: Image.PreserveAspectFit

        source: "file:/Users/james/Repositories/QT/TeslaInfotainment/ui/Assets/search.png"
    }

    Text {
        id: navigationPlaceHolderText
        color: "#373737"
        text: "Navigate"

        visible: navigationTextInput.text == ""

        anchors {
            verticalCenter: parent.verticalCenter
            left: searchIcon.right
            leftMargin: 20
        }
    }

    TextInput {
        id: navigationTextInput
        clip: true //Stop Text Overrunning
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            left: searchIcon.right
            leftMargin: 20
        }
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 16

    }

}
