#!/bin/bash

cd
apt-get update
apt-get install -y libusb-1.0-0 libusb-1.0-0-dev dkms libssl-dev linux-headers-generic
apt-get download ros-kinetic-librealsense
dpkg-deb -R ros-kinetic-librealsense*.deb librs/
cd librs/DEBIAN
wget https://raw.githubusercontent.com/mojin-robotics/realsense/realsense_substitute/realsense_camera/patch/postinst.patch
patch < postinst.patch
rm postinst.patch
cd
dpkg-deb -b librs/ ros-kinetic-librealsense_1.12.1-0xenial-mojin_amd64.deb
dpkg -i ros-kinetic-librealsense_1.12.1-0xenial-mojin_amd64.deb
apt-mark hold ros-kinetic-librealsense
