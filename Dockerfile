FROM dolphinwing/android-build:ndk-latest

ENV GSTREAMER_SDK_ROOT /opt/gstreamer-1.0-android

# Install required tools
#RUN apt-get update -yqq && apt-get install -y \
#  curl expect git openjdk-8-jdk wget unzip vim \
#  && apt-get clean && apt-get autoremove

RUN groupadd android && useradd -d /opt/gstreamer-sdk-android -g android android

COPY tools/gstreamer-sdk.sh /opt/tools/

RUN /opt/tools/gstreamer-sdk.sh

