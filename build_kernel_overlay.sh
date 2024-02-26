#!/bin/bash

# Local macros
CUR_DIR=$PWD
BUILD_DIR=$CUR_DIR/build_kernel
KERNEL_OVERLAY_DIR=$BUILD_DIR/linux-kernel-overlay-intel-innodisk
RELEASE_KERNEL_DIR=$CUR_DIR/release/Ultra_Processor/kernel

# Git Config
git config --global http.sslVerify false
git config --global http.postBuffer 10485760000
git config --global core.compression -1
git config --global http.lowSpeedLimit 0
git config --global http.lowSpeedTime 999999

if [ ! -d $BUILD_DIR ]
then
    mkdir -p $BUILD_DIR
fi

# download & build "linux-kernel-overlay-intel-innodisk"
cd $BUILD_DIR
if [ ! -d "./linux-kernel-overlay-intel-innodisk" ]
then
    echo "##### linux-kernel-overlay-intel-innodisk doesn't exists. Download will start soon ..."
    git clone https://github.com/yichen1646/linux-kernel-overlay-intel-innodisk.git --depth 1 -b v6.2-ubuntu-innodisk
    cd linux-kernel-overlay-intel-innodisk
fi

cd $KERNEL_OVERLAY_DIR

sudo ./build.sh

# Release package
if [ ! -d "$RELEASE_KERNEL_DIR" ]
then
    mkdir -p $RELEASE_KERNEL_DIR
fi

sudo mv $KERNEL_OVERLAY_DIR/*.deb $RELEASE_KERNEL_DIR
