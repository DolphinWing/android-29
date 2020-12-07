FROM ubuntu:18.04

ENV ANDROID_HOME /opt/android-sdk-linux
#ENV ANDROID_SDK_HOME /opt/android-sdk-linux
ENV ANDROID_SDK_ROOT $ANDROID_HOME

ENV PATH "${PATH}:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/cmdline-tools/bin:${ANDROID_HOME}/bin"

ENV DEBIAN_FRONTEND noninteractive

# Install required tools
# Dependencies to execute Android builds
RUN apt-get update -yqq && apt-get install -y \
  curl expect git openjdk-11-jdk wget unzip vim \
  && apt-get clean && apt-get autoremove
# git commit-msg editor
ENV EDITOR vim
# sdkmanager and android tools use java11
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

RUN groupadd android && useradd -d /opt/android-sdk-linux -g android android

COPY tools /opt/tools
#COPY licenses /opt/licenses

WORKDIR /opt/android-sdk-linux

RUN /opt/tools/entrypoint.sh built-in

RUN /opt/android-sdk-linux/cmdline-tools/bin/sdkmanager --sdk_root=${ANDROID_HOME} \
  "build-tools;30.0.2" "platforms;android-30" \
  && /opt/android-sdk-linux/cmdline-tools/bin/sdkmanager --sdk_root=${ANDROID_HOME} \
  --uninstall "emulator"

WORKDIR /root
RUN /opt/tools/env_setup.sh

#can be replaced by -it when init
CMD /opt/tools/entrypoint.sh built-in
