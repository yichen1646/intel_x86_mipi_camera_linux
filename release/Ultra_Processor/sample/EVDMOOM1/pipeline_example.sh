#!/bin/bash

# open /dev/video201
# gst-launch-1.0 v4l2src device=/dev/video201 ! videoconvert ! videoscale ! video/x-raw,width=1052,height=780 ! fpsdisplaysink video-sink=ximagesink sync=false

# open /dev/video202
# gst-launch-1.0 v4l2src device=/dev/video202 ! videoconvert ! videoscale ! video/x-raw,width=1052,height=780 ! fpsdisplaysink video-sink=ximagesink sync=false

# open /dev/video201 & /dev/video202
gst-launch-1.0 v4l2src device=/dev/video201 ! videoconvert ! videoscale ! video/x-raw,width=1052,height=780 ! videomixer name=mix sink_1::xpos=1052 ! videoconvert ! fpsdisplaysink video-sink=ximagesink sync=false v4l2src device=/dev/video202 ! videoconvert ! videoscale ! video/x-raw,width=1052,height=780 ! mix.
