#!/bin/sh
export TARGET_TRIPLE=i686-linux-android26
export MESON_CPU_FAMILY=x86
export MESON_CPU=i686
exec ./build.sh
