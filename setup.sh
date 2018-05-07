#!/bin/sh

# neovim config symlink
# ---------------------

sudo apt install neovim

ln -s -T ~/.vim ~/.config/nvim

# zsh configuration
# -----------------

sudo apt install zsh

pushd ~/.zsh

mkdir cache

# Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting

popd

# tmux configuration
# ------------------

pushd ~/.tmux

# Copy/paste from/to clipboard
sudo apt install tmux xsel

# Plugins
git clone https://github.com/NHDaly/tmux-better-mouse-mode

git clone https://github.com/tmux-plugins/tmux-battery

sudo apt install sysstat
git clone https://github.com/tmux-plugins/tmux-cpu

popd

# Download vim plugins
# --------------------

sudo apt install vim-gtk3

mkdir vim-plugins

pushd vim-plugins

git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes
git clone https://github.com/tpope/vim-fugitive
git clone https://github.com/airblade/vim-gitgutter

echo "Install the plugins in vim-plugins manually!"

popd

# Install mpd, ncmpcpp and nausea
# -------------------------------

sudo apt install mpd mpc ncmpcpp libfftw3-dev libncursesw5-dev

systemctl stop mpd.socket
systemctl stop mpd.service
systemctl disable mpd.socket
systemctl disable mpd.service

touch ~/.mpd/{mpd.db,mpd.log,mpd.pid,mpdstate}

git clone git://git.2f30.org/nausea.git
cd nausea
make
mv nausea ~/bin

# Install neofetch
# ----------------

sudo apt install neofetch

# Install LXTerminal
# ------------------

sudo apt install lxterminal
