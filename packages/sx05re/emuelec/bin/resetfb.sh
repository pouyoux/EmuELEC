#!/bin/sh

# Terrible hack as a workaround for the screen freezing after returning to ES
 (
  mpv "/storage/.config/splash/splash-1080.png" > /dev/null 2>&1
  fbterm chvt 1 < /dev/tty1 &
 )&
