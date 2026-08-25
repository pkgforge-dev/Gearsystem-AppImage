#!/bin/sh

set -eu

ARCH=$(uname -m)
export ARCH
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=https://raw.githubusercontent.com/drhelius/Gearsystem/refs/heads/master/platforms/shared/desktop/mcp/icon.png
export DEPLOY_GTK=1
export GTK_DIR=gtk-3.0
export DEPLOY_OPENGL=1

# Deploy dependencies
quick-sharun ./AppDir/bin/gearsystem

# Turn AppDir into AppImage
quick-sharun --make-appimage
