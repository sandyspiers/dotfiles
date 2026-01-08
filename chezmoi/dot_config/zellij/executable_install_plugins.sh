#!/bin/bash

echo "=========================="
echo "DOWNLOADING ZELLIJ PLUGINS"

PLUG_DIR="$HOME/.config/zellij/plugins" 
mkdir -p $PLUG_DIR
cd $PLUG_DIR
echo "Downloading to $(pwd)"

echo "Downloading sandyspiers/zjpane"
curl -L "https://github.com/sandyspiers/zjpane/releases/latest/download/zjpane.wasm" -o zjpane.wasm

echo "Download dj95/zjstatus and dj96/zjframes"
curl -L "https://github.com/dj95/zjstatus/releases/latest/download/zjstatus.wasm" -o zjstatus.wasm
curl -L "https://github.com/dj95/zjstatus/releases/latest/download/zjframes.wasm" -o zjframes.wasm

echo "Download choosetree"
curl -L "https://github.com/laperlej/zellij-choose-tree/releases/latest/download/zellij-choose-tree.wasm" -o zellij-choose-tree.wasm

cd -
echo "=========================="

