#!/bin/sh

Xephyr -br -ac -noreset -screen 1920x1080 :1 &
sleep 1 &&
DISPLAY=:1 bspwm &
