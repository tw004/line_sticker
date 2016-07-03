#!/bin/bash

FPATH=stickers/$1

if [ ! -d "$FPATH" ]; then
mkdir $FPATH
url="https://store.line.me/stickershop/product/$2/zh-Hant"
wget --no-check-certificate $url -O - \
	     | grep -o 'https://sdl-stickershop.line.naver.jp/.*stickers/.*\.png' > images.txt
wget --no-check-certificate -i images.txt
mv *.png $FPATH
fi
