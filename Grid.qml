import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.1
import "http://qmlweb.shaan7.info/qmlweb" as QmlWeb

ColumnLayout {
    Image {
        Layout.alignment: Qt.AlignHCenter
        source: 'http://iconizer.net/files/Sketchy_Social_Media_icons/orig/Flickr-logo.png'
    }

    GridView {
        id: theGrid
        Layout.fillWidth: true; Layout.fillHeight: true
        clip: true

        delegate: Thumbnail {
            isCurrentItem: GridView.isCurrentItem
            progress: isCurrentItem ? fullScreenImage.progress : 1
            onClicked: theGrid.currentIndex = index
        }
        model: FlickrModel {}

        Rectangle {
            id: fullScrenImageRect
            anchors.centerIn: parent; color: 'black'

            width: visible && fullScreenImage.ready ? parent.width : 0
            height: visible && fullScreenImage.ready ? parent.height : 0

            Image {
                id: fullScreenImage
                property bool ready: status === Image.Ready
                anchors.fill: parent

                fillMode: Image.PreserveAspectFit
                source: visible && theGrid.currentItem ? theGrid.currentItem.fullImageUrl : ''

                MouseArea {
                    anchors.fill: parent; onClicked: fullScrenImageRect.visible = false
                }
            }

            Behavior on width {
                NumberAnimation { duration: 200 }
            }

            Behavior on height {
                NumberAnimation { duration: 200 }
            }
        }

        onCurrentIndexChanged: fullScrenImageRect.visible = true
    }
}
