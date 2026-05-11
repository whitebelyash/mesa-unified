#!/bin/sh
rm build-crossfile
envsubst <crossfile >build-crossfile
meson setup "build-android" \
        --prefix=/tmp/zink-$MESON_CPU_FAMILY \
        --cross-file "build-crossfile" \
            -Dplatforms=android \
            -Dplatform-sdk-version=34 \
            -Dandroid-stub=true \
            -Dxlib-lease=disabled \
            -Degl=enabled \
            -Dgbm=disabled \
            -Dglx=disabled \
            -Dgles1=disabled \
            -Dgles2=enabled \
            -Dopengl=true \
	    -Dfreedreno-kmds=kgsl \
            -Dvulkan-drivers="" \
            -Degl-lib-suffix=_mesa \
            -Dandroid-libbacktrace=disabled \
            -Dgallium-drivers=freedreno,zink \
	    -Dallow-fallback-for=libdrm \
       ..
ninja -C "build-android" install
