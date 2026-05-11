#!/bin/sh
export TARGET_TRIPLE=aarch64-linux-android34
export MESON_CPU_FAMILY=aarch64
export MESON_CPU=armv8
exec ./build.sh
