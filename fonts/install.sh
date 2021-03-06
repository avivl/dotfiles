#!/bin/sh
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
# clean-up a bit
rm -rf fonts
cd ..
install() {
	curl -L -s -o "$1/SourceCodePro-Light.ttf" \
		https://github.com/adobe-fonts/source-code-pro/raw/release/TTF/SourceCodePro-Light.ttf
}

if [ "$(uname -s)" = "Darwin" ]; then
	if command -v brew >/dev/null 2>&1; then
		brew tap homebrew/cask-fonts
		brew cask install font-source-code-pro
	else
		install ~/Library/Fonts
	fi
else
	mkdir -p ~/.fonts
	install ~/.fonts
fi