FROM ubuntu:18.04

ENV ANDROID_SDK_HOME /opt/android-sdk-linux
ENV ANDROID_SDK_ROOT /opt/android-sdk-linux
ENV ANDROID_HOME /opt/android-sdk-linux
ENV ANDROID_SDK /opt/android-sdk-linux

ENV PATH "${PATH}:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/emulator:${ANDROID_HOME}/bin"

ENV DEBIAN_FRONTEND noninteractive

# Install required tools
# Dependencies to execute Android builds

RUN dpkg --add-architecture i386 && apt-get update -yqq && apt-get install -y \
  curl \
  expect \
  git \
  libc6:i386 \
  libgcc1:i386 \
  libncurses5:i386 \
  libstdc++6:i386 \
  zlib1g:i386 \
  openjdk-8-jdk \
  wget \
  unzip \
  vim \
  && apt-get clean

RUN groupadd android && useradd -d /opt/android-sdk-linux -g android android

COPY tools /opt/tools

COPY licenses /opt/licenses

WORKDIR /opt/android-sdk-linux

RUN /opt/tools/entrypoint.sh built-in

RUN ${ANDROID_HOME}/tools/bin/sdkmanager "build-tools;29.0.3"

RUN ${ANDROID_HOME}/tools/bin/sdkmanager "platforms;android-29"

RUN ${ANDROID_HOME}/tools/bin/sdkmanager "platform-tools"

RUN ${ANDROID_HOME}/tools/bin/sdkmanager "emulator"

RUN ${ANDROID_HOME}/tools/bin/sdkmanager "system-images;android-29;google_apis;x86_64"

ENV EDITOR vim
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64
ENV ANDROID_NDK_ROOT ${ANDROID_HOME}/ndk/21.0.6113669

RUN ${ANDROID_HOME}/tools/bin/sdkmanager "cmake;3.6.4111459" "ndk;21.0.6113669"

ENV GSTREAMER_ROOT_ANDROID /opt/gstreamer-1.0-android

RUN mkdir -p ${GSTREAMER_ROOT_ANDROID} && chown android:android ${GSTREAMER_ROOT_ANDROID}

RUN /opt/tools/gstreamer-sdk.sh

WORKDIR /root

RUN /opt/tools/env-setup.sh

RUN apt-get install -y pkg-config && apt-get clean

CMD /bin/bash
