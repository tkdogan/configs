#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

if [ ! -L $HOME/.config/nvim ]; then
	mkdir -p $HOME/.config
	ln -s $SCRIPTPATH/nvim/ $HOME/.config/nvim
fi

if [ ! -L $HOME/.portablerc ]; then
	ln -s $SCRIPTPATH/.portablerc $HOME/.portablerc
	echo 'source $HOME/.portablerc' >> $HOME/.bash_profile
fi

if [ ! -L $HOME/.Xresources ]; then
	ln -s $SCRIPTPATH/.Xresources $HOME/.Xresources
fi
