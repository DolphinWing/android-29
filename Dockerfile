FROM dolphinwing/android-build:android-29

ENV ANDROID_NDK_ROOT ${ANDROID_HOME}/ndk/21.0.6113669

RUN sdkmanager "cmake;3.6.4111459" "ndk;21.0.6113669"

RUN apt-get update -yqq && apt-get install -y pkg-config \
  && apt-get clean && apt-get autoremove -yqq
