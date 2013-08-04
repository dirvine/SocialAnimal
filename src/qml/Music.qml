import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.0
import QtQuick.Particles 2.0
import QtQuick.XmlListModel 2.0
import QtMultimedia 5.0
import FreedomCrypt 1.0


ApplicationWindow {
  id: root
  title: qsTr("Social Animal 1.0")
  minimumWidth: 600
  minimumHeight: 400


  FreedomCryptModel {
    id: freedom
  }

  toolBar: ToolBar {
    id: toolbar
    opacity: 1
    width: root.width
    implicitWidth: 600
    height: 30
    visible: true
    RowLayout {
      ToolButton {
        iconSource: "qrc:/images/social/twitter.svg"
      }
      ToolButton {
        iconSource: "qrc:/images/social/facebook.svg"
      }
      ToolButton {
        iconSource: "qrc:/images/social/instagram.svg"
      }
      ToolButton {
        iconSource: "qrc:/images/social/googleplus.svg"
      }
      ToolButton {
        iconSource: "qrc:/images/social/linkedin.svg"
      }
      ToolButton {
        iconSource: "qrc:/images/social/reddit.svg"
      }
      ToolButton {
        iconSource: "qrc:/images/social/youtube.svg"
        onClicked: fileDialog.open()
      }
      ToolButton {
        iconSource: "qrc:/images/social/wordpress.svg"
      }
      ToolButton {
        iconSource: "qrc:/images/social/aboutme.svg"
      }
      ToolButton {
        iconSource: "qrc:/images/social/flickr.svg"
      }
      ToolButton {
        iconSource: "qrc:/images/social/github.svg"
      }
    }
  }
  // ##############Pages ########################
  Rectangle {
    color: "blue"

    anchors.fill: parent

    focus: false

  Video {
    id: video
    width : root.width
    height : root.height
    MouseArea {
      anchors.fill: parent
      onClicked: {
        video.play()
      }
    }
    focus: true
    Keys.onSpacePressed: video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
    Keys.onLeftPressed: video.seek(video.position - 5000)
    Keys.onRightPressed: video.seek(video.position + 5000)
  }
  FileDialog {
    id: fileDialog
    title: "Please choose a file"
    nameFilters: [ "All files (*.*)", "All files (*)" ]
    selectMultiple : false
    onAccepted: {
            video.source = fileDialog.fileUrl
            video.play()
     }
  }
 }
  //    Item {
  //        id: appRoot
  //       // Component.onCompleted: loader.source = LifeStuff.isLoggedIn ? "main_page.qml" : "Login.qml"
  //        //Component.onCompleted: loader.source = "qrc:/qml/login.qml"
  //        // content
  //        Loader {
  //            id: loader
  //            focus: true
  //        }
  //    }

  //#########################################


  //    statusBar: StatusBar {
  //        id: statusbar
  //        height: 12
  //        anchors.right: parent.right
  //        anchors.left: parent.left
  //        anchors.top: parent.top
  //            Label {
  //                id: statusrow
  //                anchors.centerIn: parent
  //                text: "Please login"
  //                fontSizeMode: Text.Fit
  //            }
  //    }
}
