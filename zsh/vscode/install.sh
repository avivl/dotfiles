#!/bin/sh
if command -v code >/dev/null; then
	if [ "$(uname -s)" = "Darwin" ]; then
		VSCODE_HOME="$HOME/Library/Application Support/Code"
	else
		VSCODE_HOME="$HOME/.config/Code"
	fi
	mkdir -p "$VSCODE_HOME/User"

	ln -sf "$DOTFILES/vscode/settings.json" "$VSCODE_HOME/User/settings.json"
	ln -sf "$DOTFILES/vscode/keybindings.json" "$VSCODE_HOME/User/keybindings.json"
	ln -sf "$DOTFILES/vscode/snippets" "$VSCODE_HOME/User/snippets"

	# from `code --list-extensions`
	modules="
alefragnani.project-manager
batisteo.vscode-django
bigonesystems.django
budparr.language-hugo-vscode
bungcip.better-toml
caarlos0.language-prometheus
castwide.solargraph
christian-kohler.npm-intellisense
christian-kohler.path-intellisense
codezombiech.gitignore
DavidAnson.vscode-markdownlint
deerawan.vscode-dash
donjayamanne.git-extension-pack
donjayamanne.githistory
donjayamanne.jupyter
donjayamanne.python-extension-pack
dunstontc.vscode-docker-syntax
eamodio.gitlens
EditorConfig.EditorConfig
ericadamski.carbon-now-sh
erichbehrens.pull-request-monitor
frhtylcn.pythonsnippets
ginfuru.ginfuru-better-solarized-dark-theme
heptio.jsonnet
HookyQR.beautify
ipedrazas.kubernetes-snippets
magicstack.MagicPython
mauve.terraform
moozzyk.Arduino
ms-kubernetes-tools.vscode-kubernetes-tools
ms-python.python
ms-vscode.cpptools
ms-vscode.Go
patbenatar.advanced-new-file
PKief.material-icon-theme
platformio.platformio-ide
pnp.polacode
redhat.vscode-yaml
rust-lang.rust
shanoor.vscode-nginx
timonwong.shellcheck
tushortz.python-extended-snippets
VisualStudioExptTeam.vscodeintellicode
wholroyd.jinja
wmaurer.change-case
ziyasal.vscode-open-in-github
"
	for module in $modules; do
		code --install-extension "$module" || true
	done
fi
