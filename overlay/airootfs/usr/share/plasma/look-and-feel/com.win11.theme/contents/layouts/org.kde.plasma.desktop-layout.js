var desktopsArray = desktops();
for (var i = 0; i < desktopsArray.length; i++) {
  var d = desktopsArray[i];
  d.wallpaperPlugin = "org.kde.image";
  d.currentConfigGroup = ["Wallpaper", "org.kde.image", "General"];
  d.writeConfig("Image", "file:///usr/share/plasma/look-and-feel/com.win11.theme/contents/wallpapers/Win11/contents/images/1920x1080.svg");
}

var panel = new Panel("win11panel");
panel.location = "bottom";
panel.height = 44;

var launcher = panel.addWidget("org.kde.plasma.kickoff");
launcher.currentConfigGroup = ["General"];
launcher.writeConfig("icon", "start-here");

var spacer1 = panel.addWidget("org.kde.plasma.panelspacer");
spacer1.currentConfigGroup = ["General"];
spacer1.writeConfig("expanding", "true");

var tasks = panel.addWidget("org.kde.plasma.icontasks");

var spacer2 = panel.addWidget("org.kde.plasma.panelspacer");
spacer2.currentConfigGroup = ["General"];
spacer2.writeConfig("expanding", "true");

var tray = panel.addWidget("org.kde.plasma.systemtray");
tray.currentConfigGroup = ["General"];

var clock = panel.addWidget("org.kde.plasma.digitalclock");
var showDesktop = panel.addWidget("org.kde.plasma.showdesktop");