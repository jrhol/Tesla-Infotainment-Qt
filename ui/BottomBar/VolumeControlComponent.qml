import QtQuick 2.15

Item {
    property string fontColor: "#f0eded"

    Connections {
        target: audioController

        function onvolumeLevelChanged()
        {
            volumeIcon.visible = false
            visibleTimer.stop()
            visibleTimer.start()
        }
    }

    Timer {
        id: visibleTimer
        interval: 1000
        repeat: false
        onTriggered: {
            volumeIcon.visible = true
        }
    }

    width: 120 * (parent.width/1280)

    Rectangle {
        id: decrementButton
        anchors {
            right: volumeIcon.left
            rightMargin: 15
            top: parent.top
            bottom: parent.bottom
        }

        width: height / 2
        color: "black"
        Text {
            id: decrementText
            anchors.centerIn: parent
            color: fontColor
            text: "<"
            font.pixelSize :12
        }

        MouseArea {
            anchors.fill: parent
            onClicked:audioController.incrementVolume(-1)
        }
    }

    Image {
        id: volumeIcon

        height: parent.height * 0.5
        fillMode: Image.PreserveAspectFit

        anchors {
            right: incrementButton.left
            rightMargin: 15
            verticalCenter: parent.verticalCenter
        }
        source: {
            if (audioController.volumeLevel <= 1)
                return('file:/Users/james/Repositories/QT/TeslaInfotainment/ui/Assets/mute-volume.png')
            else if (audioController.volumeLevel <= 40)
                return('file:/Users/james/Repositories/QT/TeslaInfotainment/ui/Assets/low-volume.png')
            else if (audioController.volumeLevel <= 80)
                return('file:/Users/james/Repositories/QT/TeslaInfotainment/ui/Assets/medium-volume.png')
            else
                return('file:/Users/james/Repositories/QT/TeslaInfotainment/ui/Assets/high-volume.png')
        }

    }

    Text {
        id: volumeTextLabel
        visible: !volumeIcon.visible
        anchors {
            centerIn: volumeIcon
        }
        color: fontColor
        font.pixelSize: 24
        text: audioController.volumeLevel
    }


    Rectangle {
        id: incrementButton
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }

        width: height / 2
        color: "black"
        Text {
            id: incrementText
            anchors.centerIn: parent
            color: fontColor
            text: ">"
            font.pixelSize :12
        }

        MouseArea {
            anchors.fill: parent
            onClicked:audioController.incrementVolume(1)
        }
    }
}
