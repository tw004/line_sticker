#!/bin/bash


url="https://store.line.me/stickershop/product/$1/zh-Hant"
dirname=$(wget --no-check-certificate $url -O - \
	     | grep 'mdCMN08Ttl' | cut -f 2 -d ">" | cut -f 1 -d "<" | tr ' ' '_')

FPATH=stickers/$dirname
	     
if [ ! -d "$FPATH" ]; then
	mkdir $FPATH
	if [ ! $? ]; then
		FPATH=stickers/$1
		mkdir $FPATH
	fi

wget --no-check-certificate $url -O - \
	     | grep -o 'https://sdl-stickershop.line.naver.jp/.*stickers/.*\.png' > images.txt
wget --no-check-certificate -i images.txt
mv *.png $FPATH
fi
