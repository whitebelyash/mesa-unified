#!/bin/sh
export TARGET_TRIPLE=aarch64-linux-android29
export MESON_CPU_FAMILY=aarch64
export MESON_CPU=armv8
export EXTRA_ARGS="-Dfreedreno-kmds=kgsl -Dgallium-drivers=zink,freedreno,virgl"
if [[ $1 == "turnip" ]]; then
	exec ./build_turnip.sh
else
	exec ./build.sh
fi
