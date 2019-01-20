#!/bin/sh
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
export PATH="$HOME/.goenv/shims:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin
