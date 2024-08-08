import QtQuick 2.15

Rectangle
{
    id: leftScreen

    anchors  {
        top: parent.top
        bottom: bottomBar.top
        left: parent.left
        right: rightScreen.left
    }
    color: "white" //For Visualisation Purpose

    Image {
        id: carRender
        anchors.centerIn: parent
        width: parent.width * 0.85
        fillMode: Image.PreserveAspectFit
        source: 'file:/Users/james/Repositories/QT/TeslaInfotainment/ui/Assets/carImage.png'
    }
}
