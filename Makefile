# Makefile
pwd := $(shell pwd -LP)

link:
	#vim
	@if [ ! . -ef ~/.vim ]; then ln -nfs "${pwd}/vim" ~/.vim; fi
	@if [ ! . -ef ~/.config/nvim ]; then ln -nfs "${pwd}/vim" ~/.config/nvim; fi
	@ln -nfs "${pwd}/vim/init.vim" ~/.vimrc
	#zsh
	@if [ ! . -ef ~/.vim ]; then ln -nfs "${pwd}/zsh/zsh" ~/.zsh; fi
	@ln -nfs "${pwd}/zsh/zlogin" ~/.zlogin
	@ln -nfs "${pwd}/zsh/zprofile" ~/.zprofile
	@ln -nfs "${pwd}/zsh/zshenv" ~/.zshenv
	@ln -nfs "${pwd}/zsh/zshrc" ~/.zshrc
	@ln -nfs "${pwd}/zsh/zlogout" ~/.zlogout
	@ln -nfs "${pwd}/zsh/zpreztorc" ~/.zpreztorc
	#git
	@ln -nfs "${pwd}/git/git.scmbrc" ~/.git.scmbrc
	@ln -nfs "${pwd}/git/gitconfig" ~/.gitconfig
	@ln -nfs "${pwd}/git/gitignore" ~/.gitignore
	#tmux
	@if [ ! . -ef ~/.tmuxinator ]; then ln -nfs "${pwd}/tmux/tmuxinator" ~/.tmuxinator; fi
	@if [ ! . -ef ~/.tmux ]; then ln -nfs "${pwd}/tmux/tmux" ~/.tmux; fi
	@ln -nfs "${pwd}/tmux/tmux.conf" ~/.tmux.conf
	#docker
	@if [ ! . -ef ~/.docker ]; then ln -nfs "${pwd}/docker" ~/.docker; fi
	#hg
	@ln -nfs "${pwd}/hg/hgrc" ~/.hgrc
	#bin
	@if [ ! . -ef ~/.bin ]; then ln -nfs "${pwd}/bin" ~/.bin; fi
	@chmod 744 "${pwd}/bin/"*


