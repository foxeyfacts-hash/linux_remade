import QtQuick 2.15
import SddmComponents 2.0

Rectangle {
    id: root
    width: 1920
    height: 1080
    color: "#e9f2ff"

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#e9f2ff" }
            GradientStop { position: 1.0; color: "#cfe3ff" }
        }
    }

    Rectangle {
        width: 420
        height: 320
        radius: 18
        color: "#ffffff"
        opacity: 0.9
        anchors.centerIn: parent
        border.color: "#e2e2e2"

        Column {
            anchors.centerIn: parent
            spacing: 12
            width: parent.width - 60

            Text {
                text: "Welcome"
                font.pixelSize: 24
                color: "#1a1a1a"
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
            }

            TextBox {
                id: username
                width: parent.width
                text: userModel.lastUser
                placeholderText: "Username"
            }

            PasswordBox {
                id: password
                width: parent.width
                placeholderText: "Password"
                onAccepted: loginButton.clicked()
            }

            LoginButton {
                id: loginButton
                width: parent.width
                text: "Sign in"
                onClicked: sddm.login(username.text, password.text, sessionModel.lastIndex)
            }
        }
    }
}