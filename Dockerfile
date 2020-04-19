FROM ubuntu:18.04

ENV ANDROID_HOME /opt/android-sdk-linux
#ENV ANDROID_SDK_HOME /opt/android-sdk-linux
ENV ANDROID_SDK_ROOT /opt/android-sdk-linux
#ENV ANDROID_SDK /opt/android-sdk-linux

ENV PATH "${PATH}:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/bin"

ENV DEBIAN_FRONTEND noninteractive

# Install required tools
# Dependencies to execute Android builds
RUN apt-get update -yqq && apt-get install -y \
  curl expect git openjdk-8-jdk wget unzip vim \
  && apt-get clean && apt-get autoremove
# git commit-msg editor
ENV EDITOR vim
# sdkmanager and android tools use java8
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64

RUN groupadd android && useradd -d /opt/android-sdk-linux -g android android

COPY tools /opt/tools
#COPY licenses /opt/licenses

WORKDIR /opt/android-sdk-linux

RUN /opt/tools/entrypoint.sh built-in

RUN /opt/android-sdk-linux/tools/bin/sdkmanager --sdk_root=${ANDROID_HOME} \
  "build-tools;29.0.3" "platforms;android-29" "platform-tools" "tools" \
  && /opt/android-sdk-linux/tools/bin/sdkmanager --sdk_root=${ANDROID_HOME} \
  --uninstall "emulator"

WORKDIR ~

#can be replaced by -it when init
CMD /opt/tools/entrypoint.sh built-in
