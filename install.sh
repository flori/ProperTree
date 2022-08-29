#!/bin/sh


brew install python@3.9
brew install python-tk@3.9
rm -rf ProperTree.app
mkdir -p ProperTree.app/Contents/MacOS/Scripts ProperTree.app/Contents/Resources
find -E . -type f -regex '.*/Scripts/.*\.(py|plist|json)$' | cpio -pd ProperTree.app/Contents/MacOS/
cp ProperTree.py ProperTree.app/Contents/MacOS/ProperTree.command
cp Scripts/shortcut.icns ProperTree.app/Contents/Resources/
cat > ProperTree.app/Contents/Info.plist << EOT
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleDevelopmentRegion</key>
	<string>English</string>
	<key>CFBundleDocumentTypes</key>
	<array>
		<dict>
			<key>CFBundleTypeExtensions</key>
			<array>
				<string>plist</string>
			</array>
			<key>CFBundleTypeIconFile</key>
			<string>plist</string>
			<key>CFBundleTypeName</key>
			<string>Property List</string>
			<key>CFBundleTypeRole</key>
			<string>Viewer</string>
		</dict>
	</array>
	<key>CFBundleExecutable</key>
	<string>ProperTree.command</string>
	<key>CFBundleIconFile</key>
	<string>shortcut.icns</string>
	<key>CFBundleIdentifier</key>
	<string>com.corpnewt.ProperTree</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>0.0</string>
	<key>CFBundleName</key>
	<string>ProperTree</string>
	<key>CFBundlePackageType</key>
	<string>APPL</string>
	<key>CFBundleShortVersionString</key>
	<string>0.0</string>
	<key>CFBundleSignature</key>
	<string>????</string>
	<key>CFBundleVersion</key>
	<string>0.0</string>
	<key>LSMinimumSystemVersion</key>
	<string>10.4</string>
	<key>LSMultipleInstancesProhibited</key>
	<true/>
	<key>NSHumanReadableCopyright</key>
	<string>Copyright 2019 CorpNewt</string>
</dict>
</plist>
EOT
sed -i -e 's,^#!.*python.*,#!/usr/local/bin/python3.9,' ProperTree.app/Contents/MacOS/ProperTree.command
sudo rm -rf /Applications/ProperTree.app
sudo cp -r ProperTree.app /Applications/ProperTree.app
