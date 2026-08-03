#!/bin/sh
rm build-crossfile

install_ndk() {
	# install ndk
	echo "Installing NDK"
	curl https://dl.google.com/android/repository/android-ndk-r29-linux.zip --output android-ndk-r29-linux.zip
	unzip android-ndk-r29-linux.zip
	export ANDROID_NDK_HOME="$(pwd)/android-ndk-r29"
}

if [ ! -d "${ANDROID_NDK_HOME}" ]; then
	echo "NDK not found. Set ANDROID_NDK_HOME if you want to use a preinstalled NDK"
	install_ndk
fi

echo "Will use NDK at ${ANDROID_NDK_HOME}"
echo "Arch (matrix): ${MATRIX_ARCH}"

echo "Begin building Mesa"
envsubst <crossfile >build-crossfile
meson setup .. "build-android" \
        --prefix=/tmp/zink-${MATRIX_ARCH} \
        --cross-file "build-crossfile" \
            -Dplatforms=android \
	    -Dbuildtype=release \
	    -Dstrip=true \
	    -Degl=disabled \
            -Dplatform-sdk-version=34 \
            -Dandroid-stub=true \
            -Dandroid-libbacktrace=disabled \
            -Dvulkan-drivers=freedreno \
	    -Dgallium-drivers="" \
	    -Dallow-fallback-for=libdrm
ninja -C "build-android" install
