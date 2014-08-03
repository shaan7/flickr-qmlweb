import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.XmlListModel 2.0
import QtQuick.Layouts 1.1
import "http://qmlweb.shaan7.info/qmlweb" as QmlWeb

Item {
    ListView {
        id: theList

        anchors { fill: parent; margins: 10 }
        spacing: 5
        header: Label { text: theList.count + " items" }
        delegate: RowLayout {
            id: delegateRow
            Image {
                property string url_without_size: "http://farm" + farm + ".static.flickr.com/" + server + "/" + id + "_" + secret
                source: url_without_size + (delegateRow.ListView.isCurrentItem ? ".jpg" : "_s.jpg")
                scale: delegateRow.ListView.isCurrentItem && status == Image.Ready ?  1.2 : 1
                opacity: delegateRow.ListView.isCurrentItem ? 1 : 0.4
                z: delegateRow.ListView.isCurrentItem ? 2 : 0

                ProgressBar {
                        anchors.fill: parent
                        visible: value != 1
                        value: parent.progress
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: theList.currentIndex = index
                }

                Behavior on scale {
                        NumberAnimation { duration: 100 }
                }
                Behavior on opacity {
                        NumberAnimation { duration: 100 }
                }
            }

            Label {
                font.pointSize: 16
                text: title
            }
        }

        model: XmlListModel {
            source: "https://api.flickr.com/services/rest/?" +
                    "method=flickr.photos.getRecent&" +
                    "per_page=30&" +
                    "sort=date-taken-desc&" +
                    "api_key=e36784df8a03fea04c22ed93318b291c"
            query: "/rsp/photos/photo"

            XmlRole { name: "title"; query: "@title/string()" }
            XmlRole { name: "datetaken"; query: "@datetaken/string()" }
            XmlRole { name: "farm"; query: "@farm/string()" }
            XmlRole { name: "server"; query: "@server/string()" }
            XmlRole { name: "id"; query: "@id/string()" }
            XmlRole { name: "secret"; query: "@secret/string()" }
        }
    }
}
