tar -xvf firefox-114.0.1.tar.bz2

echo "[I] Checking for already existent files..."
[ -f /usr/bin/firefox ] && rm -rvf /usr/bin/firefox
[ -d /opt/firefox-bin ] && rm -rvf /opt/firefox-bin
[ -f /usr/share/applications/firefox.desktop ] && rm -rvf /usr/share/applications/firefox.desktop

echo "[I] Procceding with files installation..."
mv -v ./firefox /opt/firefox-bin

ln -svf /opt/firefox-bin/firefox /usr/bin/firefox

cat > /usr/share/applications/firefox.desktop << "EOF"
[Desktop Entry]
Encoding=UTF-8
Name=Mozilla Firefox
GenericName=Web Browser
Comment=Browse the Web
Exec=firefox
Icon=/opt/firefox-bin/browser/chrome/icons/default/default128.png
Terminal=false
Type=Application
Categories=Application;Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;
StartupNotify=True
EOF
