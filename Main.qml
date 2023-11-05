import QtQuick 2.5
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4 as Qqc
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.2
import QtMultimedia 5.5
import SddmComponents 2.0


Rectangle{

    color:"black"
	Connections {
		target: sddm

		onLoginSucceeded: {
		}

		onLoginFailed: {
			denied.play()
		}
	}

	AnimatedImage {
		width: Window.width
		height: Window.height
		fillMode: Image.Tile
		source: "bg_dark.gif"
	}
	
	AnimatedImage {
		width: Window.width
		height: Window.height
		fillMode: Image.Tile
		source: "bg_darker.gif"
	}

    AnimatedImage{
        id: wiredLogin
        width: 400
        height: 400
        source: "WiredLogin.gif"
        x: 770
        y: 10
    }
    
    //IDK WHAT THIS TXT SAYS, BUT IS COOL
    AnimatedImage{
			height: 50
			source: "strange-text.gif"
            x: 620
            y: 400
		}
         
   AnimatedImage{
            width: 300
            height: 300
			source: "lain.gif"
            x: 808
            y: 470
		}	
    
    Qqc.TextField {
	              id: username
	              text: userModel.lastUser
	             style: TextFieldStyle {
				textColor: "#c1b492"
				background: Rectangle {
					color: "#000"
					implicitWidth: 200
					border.color: "#d2738a"
					radius: 10
				}
			}
			KeyNavigation.backtab: shutdownBtn; KeyNavigation.tab: password
			Keys.onPressed: {
				if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
					sddm.login(username.text, password.text, session.index)
					event.accepted = true
				}
			}
        x: 854
        y: 770
        }
    Qqc.TextField {
			id: password
			echoMode: TextInput.Password
			Layout.alignment: Qt.AlignCenter
			style: TextFieldStyle {
				textColor: "#c1b492"
				background: Rectangle {
					color: "#000"
					implicitWidth: 200
					border.color: "#d2738a"
					radius: 10
				}
			}
			KeyNavigation.backtab: username; KeyNavigation.tab: session
			Keys.onPressed: {
				if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
					sddm.login(username.text, password.text, session.index)
					event.accepted = true
				}
			}
            x: 854
            y: 830
		}
      ColumnLayout {
			Layout.alignment: Qt.AlignCenter
			Layout.topMargin: 4
			Layout.bottomMargin: 50
			width: 200	
			
			Rectangle {
				anchors.fill: parent
				color: "#d2738a"
				radius: 11
			}
			
			Qqc.Label {
				Layout.alignment: Qt.AlignCenter
				text: "Wired"
				color: "#000000"
				font.pixelSize: 20
			}
			MouseArea {
				anchors.fill: parent
				onClicked: sddm.login(username.text, password.text, session.index)
			}
            x: 854
            y: 870
        }   




/*
    the first idea was animate this image until fills the bottom screen, with animation, but idk how make this, will update later.
Item {
    id: container
    width: 1920; height: 500

    Rectangle {
        id: myRect
        AnimatedImage{
                    width: 341; height: 128
        source: "wiredgang.gif"
        }
    
    }

    states: State {
        name: "reanchored"
        AnchorChanges { target: mRect; anchors.right: container.right }
    }

    transitions: Transition {
        // smoothly reanchor myRect and move into new position
        AnchorAnimation { duration: 1000 }
    }

    Component.onCompleted: container.state = "reanchored"
    y: 952
}*/


}