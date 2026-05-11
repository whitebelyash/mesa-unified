#include "platform_android_airgap.h"
#include <system/window.h>

int droid_window_connect(void* window) {
   return native_window_api_connect((struct ANativeWindow*) window, NATIVE_WINDOW_API_EGL);
}

int droid_window_disconnect(void* window) {
   return native_window_api_disconnect((struct ANativeWindow*) window, NATIVE_WINDOW_API_EGL);
}
