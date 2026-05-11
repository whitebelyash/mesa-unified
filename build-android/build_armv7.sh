#!/bin/sh
export TARGET_TRIPLE=armv7a-linux-androideabi26
export MESON_CPU_FAMILY=arm
export MESON_CPU=armv7
exec ./build.sh
