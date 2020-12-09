FROM dolphinwing/android-build:latest

RUN apt-get update -yqq && apt-get install -y pkg-config \
  && apt-get clean && apt-get autoremove -yqq

RUN ${ANDROID_SDK_ROOT}/cmdline-tools/latest/bin/sdkmanager --sdk_root=${ANDROID_SDK_ROOT} "cmake;3.6.4111459" "ndk;21.3.6528147"

ENV ANDROID_NDK_ROOT ${ANDROID_HOME}/ndk/21.3.6528147
