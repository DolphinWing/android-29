FROM ubuntu:18.04

ENV ANDROID_SDK_HOME /opt/android-sdk-linux
ENV ANDROID_SDK_ROOT /opt/android-sdk-linux
ENV ANDROID_HOME /opt/android-sdk-linux
ENV ANDROID_SDK /opt/android-sdk-linux

ENV PATH "${PATH}:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/bin"

ENV DEBIAN_FRONTEND noninteractive

# Install required tools
# Dependencies to execute Android builds

RUN apt-get update -yqq && apt-get install -y \
  curl expect git openjdk-8-jdk wget unzip vim \
  && apt-get clean

ENV EDITOR vim

RUN groupadd android && useradd -d /opt/android-sdk-linux -g android android

COPY tools /opt/tools

COPY licenses /opt/licenses

WORKDIR /opt/android-sdk-linux

RUN /opt/tools/entrypoint.sh built-in

RUN /opt/android-sdk-linux/tools/bin/sdkmanager "build-tools;29.0.3"
RUN /opt/android-sdk-linux/tools/bin/sdkmanager "platforms;android-29"
RUN /opt/android-sdk-linux/tools/bin/sdkmanager "platform-tools"

CMD /opt/tools/entrypoint.sh built-in
