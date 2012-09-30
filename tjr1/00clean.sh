#!/bin/bash

echo "* Terminating all gstreamer pipelines... "
killall gst-launch-0.10
echo "* Terminating all per-user pulseaudio services... "
killall pulseaudio
echo "* Stopping the system-wide DBUS daemon... "
stop dbus
echo "* Cleaning up DBUS process information... "
rm /var/run/dbus/*
