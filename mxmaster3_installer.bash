#! /usr/bin/bash



# build logid
sudo apt update; wait
sudo apt install -y cmake libevdev-dev libudev-dev libconfig++-dev; wait
mkdir build
cd build
cmake ..; wait
make; wait
sudo make install; wait

# doing configuration file
mkdir -p ~/.config/logipopos
cp -v ../logid.example.cfg ~/.config/logipopos/logid.cfg

# enable/start daemon
sudo systemctl enable --now logid

# delete volume change annoying sound
mv /usr/share/sounds/Pop/stereo/action/audio-volume-change.oga \
   /usr/share/sounds/Pop/stereo/action/audio-volume-change.oga.bak

mv /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga \
   /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga.bak




