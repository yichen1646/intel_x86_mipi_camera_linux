[Install]
1. install ubuntu 22.04
2. install kernel overlay & binary
    $ sudo ./install.sh
    $ reboot

[Used]
1. Get into sample folder and choose which camera you're using
2. Create video node
    $ sudo ./start.sh
3. Play stream by GStreamer
    $ ./pipeline_example.sh

[Need]
1. install GStreamer 
    $ sudo apt-get install libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools libgstreamer-plugins-base1.0-dev
2. install V4L2 Utilitys
    $ sudo apt-get install v4l-utils v4l2loopback-dkms
