SOURCE="https://download.kde.org/unstable/kate/Kate-16.08-x86_64.AppImage"
OUTPUT="Kate.AppImage"

all:
	echo "Building: $(OUTPUT)"
	rm -f ./$(OUTPUT)
	wget --output-document=$(OUTPUT) --continue $(SOURCE)
	xorriso -indev $(OUTPUT) -osirrox on -extract / ./AppDir
	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)
	rm -rf ./AppDir

