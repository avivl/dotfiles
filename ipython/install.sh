#!/bin/sh
test -L ~/.ipython/profile_default/ipython_config.py || {
	mv ~/.ipython/profile_default/ipython_config.py ~/.ipython/profile_default/ipython_config.py.local
	ln -s "$DOTFILES"~/ipython/profile_default/ipython_config.py ~/.ipython/profile_default/ipython_config.py
}
