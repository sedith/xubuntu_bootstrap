#!/bin/bash

# cf. http://robotpkg.openrobots.org/install.html

# Prerequisites
sudo apt-get install -y bzip2 libbz2-dev pax tar tcl-dev tk-dev flex bison libtool-bin doxygen libudev-dev libsdl2-dev

# Clone
memory = `pwd`
cd ~/work/
git clone git://git.openrobots.org/robots/robotpkg

# Boostrap openrobots
cd robotpkg/bootstrap
bootstrap --prefix=$ROBOTPKG_BASE

# Copy config
cp $memory/config_files/openrobots/robotpkg.conf $ROBOTPKG_BASE/etc/

# Install set
cd ~/work/robotpkg/
make update-myset
