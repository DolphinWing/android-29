FROM dolphinwing/android-build:android-29

RUN apt-get update -yqq && apt-get install -y pkg-config \
  && apt-get clean && apt-get autoremove -yqq

RUN sdkmanager "cmake;3.6.4111459" "ndk;21.1.6352462"

ENV ANDROID_NDK_ROOT ${ANDROID_HOME}/ndk/21.1.6352462
