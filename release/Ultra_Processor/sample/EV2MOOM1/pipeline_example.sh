#!/bin/bash

# open /dev/video131
# gst-launch-1.0 v4l2src device=/dev/video131 ! videoconvert ! videoscale ! video/x-raw,width=960,height=540 ! fpsdisplaysink video-sink=ximagesink sync=false

# open /dev/video132
# gst-launch-1.0 v4l2src device=/dev/video132 ! videoconvert ! videoscale ! video/x-raw,width=960,height=540 ! fpsdisplaysink video-sink=ximagesink sync=false

# open /dev/video131 & /dev/video132
gst-launch-1.0 v4l2src device=/dev/video131 ! videoconvert ! videoscale ! video/x-raw,width=960,height=540 ! videomixer name=mix sink_1::xpos=960 ! videoconvert ! fpsdisplaysink video-sink=ximagesink sync=false v4l2src device=/dev/video132 ! videoconvert ! videoscale ! video/x-raw,width=960,height=540 ! mix.