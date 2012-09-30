#!/bin/bash

gst-launch-0.10 filesrc location=$1 ! mad ! audioconvert ! audio/x-raw-int,channels=1,depth=16,width=16,rate=$2 ! rtpL16pay ! udpsink host=141.31.8.113 port=51000
