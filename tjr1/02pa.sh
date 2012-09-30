#!/bin/bash

dbusinfo=( $(dbus-launch) )
DBUS_SESSION_BUS_ADDRESS=${dbusinfo[0]#DBUS_SESSION_BUS_ADDRESS=}
DBUS_SESSION_BUS_PID=${dbusinfo[1]#DBUS_SESSION_BUS_PID=}

export DBUS_SESSION_BUS_ADDRESS
export DBUS_SESSION_BUS_PID

export -p | grep DBUS

pulseaudio --start


