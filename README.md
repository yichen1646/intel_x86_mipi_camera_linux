[Build]
1. build binary
    $ sudo ./build_binary.sh
2. build kerenl overlay
    $ sudo ./build_kernel_overlay.sh
 
[Need]
1. install Develop tool (cmake version >=3.12)
    $ sudo apt-get install vim flex bison kernel-wedge gcc libssl-dev libelf-dev quilt devscripts debhelper git liblz4-tool cmake build-essential pkg-config libexpat1-dev rpm autoconf libtool gdebi
2. install Git
    $ sudo apt-get install git
3. install GStreamer 
    $ sudo apt-get install libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools libgstreamer-plugins-base1.0-dev
4. install V4L2 Utilitys
    $ sudo apt-get install v4l-utils v4l2loopback-dkms

[Troubleshooting]
1. Git clone RPC failed
    $ sudo apt-get install gnutls-bin
    $ git config --global http.sslVerify false
    $ git config --global http.postBuffer 10485760000
    $ git config --global core.compression -1
    $ git config --global http.lowSpeedLimit 0
    $ git config --global http.lowSpeedTime 999999
