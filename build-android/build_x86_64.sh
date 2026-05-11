#!/bin/sh
export TARGET_TRIPLE=x86_64-linux-android26
export MESON_CPU_FAMILY=x86_64
export MESON_CPU=x86_64
exec ./build.sh
