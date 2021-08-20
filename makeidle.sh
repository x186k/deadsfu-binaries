#!/bin/bash

# gst-launch-1.0 videotestsrc is-live=true num-buffers=1 !\
#     openh264enc max-slice-size=1000  slice-mode=5 num-slices=1 !\
#     h264parse !\
#     rtph264pay !\
#     multifilesink location="/Users/c/Documents/deadsfu/deadsfu-binaries/idlevid/rtp%d.rtp"


# docker run -v $PWD:/foo restreamio/gstreamer:1.18.4.0-prod /usr/bin/gst-launch-1.0 videotestsrc pattern=ball is-live=true num-buffers=10 !\
#     x264enc option-string=slice-max-size=1200 bitrate=600 speed-preset=ultrafast tune=zerolatency key-int-max=1 !\
#     video/x-h264,profile=constrained-baseline !\
#     queue max-size-time=100000000 !\
#     rtph264pay config-interval=-1 name=payloader !\
#     multifilesink location="/foo/deadsfu-binaries/idlevid/rtp%d.rtp"



#removed bitrage
# x264enc bitrate=600 

rm 

docker run -v $PWD:/foo restreamio/gstreamer:1.18.4.0-prod /usr/bin/gst-launch-1.0 filesrc location=/foo/deadsfu-idle1.mov !\
    decodebin name=decode !\
    videoconvert !\
    x264enc option-string=slice-max-size=1200 speed-preset=medium tune=zerolatency key-int-max=1 !\
    video/x-h264,profile=constrained-baseline !\
    queue max-size-time=100000000 !\
    rtph264pay config-interval=-1 name=payloader !\
    multifilesink location="/foo/idlevid.nosync/rtp%d.rtp"

ls -l  idlevid.nosync/* | wc -l