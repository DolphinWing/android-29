FROM dolphinwing/android-build:android-29

ENV ANDROID_NDK_ROOT /opt/gstreamer-1.0-android/ndk

RUN sdkmanager "cmake;3.6.4111459" "ndk;17.2.4988734"
