#!/bin/sh

# neovim config symlink
# ---------------------

ln -s -T ~/.vim ~/.config/nvim

# zsh configuration
# -----------------

pushd ~/.zsh

mkdir cache

# Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting

popd

# Download vim plugins
# --------------------

mkdir vim-plugins

pushd vim-plugins

git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/tpope/vim-fugitive
git clone https://github.com/airblade/vim-gitgutter

popd

# Install mpd, ncmpcpp and nausea
# -------------------------------

sudo apt-get install mpd mpc ncmpcpp libfftw3-dev libncursesw5-dev

systemctl stop mpd.socket
systemctl stop mpd.service
systemctl disable mpd.socket
systemctl disable mpd.service

touch ~/.mpd/{mpd.db,mpd.log,mpd.pid,mpdstate}

git clone git://git.2f30.org/nausea.git
cd nausea
make
mv nausea ~/bin

