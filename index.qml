import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2
import "http://qmlweb.shaan7.info/qmlweb" as QmlWeb

ColumnLayout {
    Image {
        Layout.alignment: Qt.AlignHCenter
        source: 'http://iconizer.net/files/Sketchy_Social_Media_icons/orig/Flickr-logo.png'
    }

    RowLayout {
        Layout.alignment: Qt.AlignHCenter
        QmlWeb.Hyperlink {
            Layout.minimumHeight: 256; Layout.minimumWidth: 256
            url: 'http://flickr.shaan7.info/List.qml'

            Image {
                anchors.fill: parent; fillMode: Image.PreserveAspectFit
                source: 'http://www.niscode.com/listicon.png'
            }
        }

        QmlWeb.Hyperlink {
            Layout.minimumHeight: 256; Layout.minimumWidth: 256
            url: 'http://flickr.shaan7.info/Grid.qml'

            Image {
                anchors.fill: parent; fillMode: Image.PreserveAspectFit
                source: 'http://www.vischline.nl/wp-content/uploads/2014/02/thumbnails.png'
            }
        }
    }
}

