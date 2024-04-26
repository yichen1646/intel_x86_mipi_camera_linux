#!/bin/bash

# Local macros
CUR_DIR=$PWD
BUILD_DIR=$CUR_DIR/build_binary
IPU6_CAMERA_BINS_DIR=$BUILD_DIR/ipu6-camera-bins
IPU6_CAMERA_HAL_DIR=$BUILD_DIR/ipu6-camera-hal
ICAMERASRC_DIR=$BUILD_DIR/icamerasrc
PATCHES_DIR=$CUR_DIR/patches_binary
RELEASE_BINARY_DIR=$CUR_DIR/release/Ultra_Processor/binary

# Git Config
git config --global --replace-all http.sslVerify false
git config --global --replace-all http.postBuffer 1048576000
git config --global --replace-all core.compression -1
git config --global --replace-all http.lowSpeedLimit 0
git config --global --replace-all http.lowSpeedTime 999999

if [ ! -d $BUILD_DIR ]
then
    mkdir -p $BUILD_DIR
fi

# download & build "icamerasrc", "ipu6-camera-hal", "ipu6-camera-bins"
cd $BUILD_DIR
if [ ! -d "./ipu6-camera-bins" ]
then
    echo "##### ipu6-camera-bins doesn't exists. Download will start soon ..."
    git clone https://github.com/intel/ipu6-camera-bins.git --depth 1 -b iotg_ipu6
    cd ipu6-camera-bins
fi

cd $BUILD_DIR
if [ ! -d "./ipu6-camera-hal" ]
then
    echo "##### ipu6-camera-hal doesn't exists. Download will start soon ..."
    git clone https://github.com/intel/ipu6-camera-hal.git --depth 1 -b iotg_ipu6
    cd ipu6-camera-hal
fi

cd $BUILD_DIR
if [ ! -d "./icamerasrc" ]
then
    echo "##### icamerasrc doesn't exists. Download will start soon ..."
    git clone https://github.com/intel/icamerasrc.git --depth 1 -b icamerasrc_slim_api
    cd icamerasrc
fi

cd $BUILD_DIR

sudo cp -r $IPU6_CAMERA_BINS_DIR/include/* /usr/include/
sudo cp -r $IPU6_CAMERA_BINS_DIR/lib/* /usr/lib/

cp $IPU6_CAMERA_HAL_DIR/build.sh .
chmod +x ./build.sh
./build.sh

# Update the binary patches
if [ -d "./.pc" ]
then
    rm -rf ./.pc
fi
cp -r $PATCHES_DIR/patches $BUILD_DIR
quilt push -a
res=$(quilt unapplied 2>&1 | head -n1 | awk -F',' '{print $1}')
if [ "$res" = "File series fully applied" ]; then
	echo "##### Patch file series fully applied."

elif [ "$res" = 'No patches in series' ]; then
	echo "##### No patches in series, continue to build."
else
	echo "##### The patches has not been fully applied: ${res}."
	exit 1
fi

# Release package
if [ ! -d "$RELEASE_BINARY_DIR/usr" ]
then
    mkdir -p $RELEASE_BINARY_DIR/usr
fi

cp -r $IPU6_CAMERA_BINS_DIR/include $RELEASE_BINARY_DIR/usr/
cp -r $IPU6_CAMERA_BINS_DIR/lib $RELEASE_BINARY_DIR/usr/
cp -r ./out/install/include $RELEASE_BINARY_DIR/usr/
cp -r ./out/install/lib $RELEASE_BINARY_DIR/usr/
cp -r ./out/install/etc $RELEASE_BINARY_DIR