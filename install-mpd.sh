#/bin/bash

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

# alias nausea='nausea -cps /tmp/mpd.fifo'

