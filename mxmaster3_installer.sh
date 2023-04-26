#! /usr/bin/bash

git clone https://github.com/kalkulusrampage/logipopos.git; wait
cd logipopos

# build logid
sudo apt update; wait
sudo apt install -y cmake libevdev-dev libudev-dev libconfig++-dev; wait
mkdir build
cd build
cmake ..; wait
make; wait
sudo make install; wait

# delete volume change annoying sound
sudo mv -v /usr/share/sounds/Pop/stereo/action/audio-volume-change.oga /usr/share/sounds/Pop/stereo/action/audio-volume-change.oga.bak
sudo mv -v /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga.bak

# doing configuration file
mkdir -p ~/.config/logipopos
cp -v ../logid.example.cfg ~/.config/logipopos/logid.cfg

# enable/start daemon
sudo systemctl enable --now logid
