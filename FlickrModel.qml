import QtQuick.XmlListModel 2.0

XmlListModel {
    source: "https://api.flickr.com/services/rest/?" +
            "method=flickr.photos.getRecent&" +
            "per_page=200&" +
            "sort=date-taken-desc&" +
            "api_key=e36784df8a03fea04c22ed93318b291c"
    query: "/rsp/photos/photo"

    XmlRole { name: "title"; query: "@title/string()" }
    XmlRole { name: "farm"; query: "@farm/string()" }
    XmlRole { name: "server"; query: "@server/string()" }
    XmlRole { name: "id"; query: "@id/string()" }
    XmlRole { name: "secret"; query: "@secret/string()" }
}
