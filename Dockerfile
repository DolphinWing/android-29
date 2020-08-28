FROM dolphinwing/android-build:android-30

RUN apt-get update -yqq && apt-get install -y pkg-config \
  && apt-get clean && apt-get autoremove -yqq

RUN sdkmanager "cmake;3.6.4111459" "ndk;21.3.6528147"

ENV ANDROID_NDK_ROOT ${ANDROID_HOME}/ndk/21.3.6528147
