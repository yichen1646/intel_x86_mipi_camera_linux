#!/bin/bash

export GST_PLUGIN_PATH=/usr/lib/gstreamer-1.0
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib
export LIBVA_DRIVER_NAME=iHD
export GST_GL_PLATFORM=egl

# video_nr -- assign camera device id
sudo modprobe v4l2loopback video_nr=130,131

gst-launch-1.0 icamerasrc device-name=ev2m_oom1 ! video/x-raw,format=UYVY,width=1920,height=1200 ! v4l2sink device=/dev/video131 &
gst-launch-1.0 icamerasrc device-name=ev2m_oom1-2 ! video/x-raw,format=UYVY,width=1920,height=1200 ! v4l2sink device=/dev/video132

sudo pkill -2 gst-launch-1.0

sudo ./end.sh
