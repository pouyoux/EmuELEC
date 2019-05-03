#!/bin/sh

# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

# Terrible hack as a workaround for the screen freezing after returning to ES
 (
  mpv "/storage/.config/splash/splash-1080.png" > /dev/null 2>&1
  fbterm chvt 1 < /dev/tty1 &
 )&
