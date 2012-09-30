#!/bin/bash

gst-launch-0.10 udpsrc port=51000 ! "application/x-rtp, media=(string)audio, clock-rate=44100, width=16, height=16, encoding-name=(string)L16,encoding-params=(string)1, channels=(int)1, channel-position=(int)1, payload=(int)96" ! gstrtpjitterbuffer do-lost=true ! rtpL16depay ! audioconvert ! lame ! filesink location=$1
