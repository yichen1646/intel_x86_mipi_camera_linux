#!/bin/bash

# Local macros
CUR_DIR=$PWD
BINARY_DIR=$CUR_DIR/binary
KERNEL_DIR=$CUR_DIR/kernel

sudo dpkg -i $KERNEL_DIR/linux-headers-6.2.0--000_6.2-0_amd64.deb
sudo dpkg -i $KERNEL_DIR/linux-image-6.2.0--000_6.2-0_amd64.deb
sudo update-grub

sudo cp -r $BINARY_DIR/usr /
sudo cp -r $BINARY_DIR/etc /