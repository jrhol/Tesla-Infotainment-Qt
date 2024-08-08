import QtQuick 2.15

Rectangle{
    id: bottomBar
    anchors{
        left: parent.left  //Anchoring to the left, right and bottom of the parent window
        right: parent.right //Allows for window resizing
        bottom: parent.bottom
    }
    color: "black"
    height: parent.height / 12 //set the height to 1/12 of the parent window

    Image{
        id: carSettingsIcon
        anchors{
            left: parent.left
            leftMargin: 30
            verticalCenter: parent.verticalCenter
        }

        height: parent.height * 0.85
        fillMode: Image.PreserveAspectFit

        source: 'file:/Users/james/Repositories/QT/TeslaInfotainment/ui/Assets/carIcon.png'
    }

    HVACComponent {
        id: passengerHVACControl
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: carSettingsIcon.right
            leftMargin: 75
        }

        hvacController: passengerHVAC

    }

    HVACComponent {
        id: driverHVACControl
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: volumeControl.left
            rightMargin: 40
        }
        hvacController: driverHVAC
    }

    VolumeControlComponent {
        id: volumeControl

        anchors{
            right: parent.right
            rightMargin: 30
            top: parent.top
            bottom: parent.bottom
        }


    }
}
