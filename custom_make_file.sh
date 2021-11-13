#!/bin/sh

# Enable non-free libraries, like AAC. Add more libraries as needed.
./configure  --prefix=/usr/local --enable-static --disable-debug --disable-shared \
--enable-gpl --enable-nonfree --enable-libass \
--enable-libfdk-aac --enable-libfreetype --enable-libmp3lame \
--enable-libtheora --enable-libvorbis --enable-libvpx --enable-libx264 --enable-libx265 --enable-libopus --enable-libxvid

# Make sure to use more than one core
make -j4

make install

