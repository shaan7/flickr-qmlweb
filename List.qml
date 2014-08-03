import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.1
import "http://qmlweb.shaan7.info/qmlweb" as QmlWeb

ColumnLayout {
    Image {
        Layout.alignment: Qt.AlignHCenter
        source: 'http://iconizer.net/files/Sketchy_Social_Media_icons/orig/Flickr-logo.png'
    }

    Item {
        Layout.fillWidth: true; Layout.fillHeight: true
        clip: true
        ListView {
            id: theList
            anchors.centerIn: parent
            height: parent.height
            width: parent.width * 0.7

            delegate: RowLayout {
                property alias fullImageUrl: thumbnail.fullImageUrl
                width: parent.width

                Thumbnail {
                    id: thumbnail
                    isCurrentItem: parent.ListView.isCurrentItem
                    progress: isCurrentItem ? fullScreenImage.progress : 1
                    onClicked: theList.currentIndex = index
                }

                Label {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.pointSize: 12; text: title
                    wrapMode: Text.WordWrap
                    verticalAlignment: Text.AlignVCenter
                }
            }

            model: FlickrModel {}

            onCurrentIndexChanged: fullScrenImageRect.visible = true
        }

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
                source: visible && theList.currentItem ? theList.currentItem.fullImageUrl : ''

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
    }
}

