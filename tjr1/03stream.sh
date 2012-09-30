#!/bin/bash

gst-launch-0.10 pulsesrc device=alsa_output.platform-snd_dummy.0.analog-stereo.monitor ! audioconvert ! audio/x-raw-int,channels=1,depth=16,width=16,rate=44100 ! rtpL16pay ! udpsink host=141.31.8.112 port=51000 &
