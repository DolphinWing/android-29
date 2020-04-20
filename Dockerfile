FROM dolphinwing/android-build:ndk-r17c

ENV GSTREAMER_ROOT_ANDROID /opt/gstreamer-1.0-android

# Install required tools
#RUN apt-get update -yqq && apt-get install -y \
#  curl expect git openjdk-8-jdk wget unzip vim \
#  && apt-get clean && apt-get autoremove

RUN mkdir -p ${GSTREAMER_ROOT_ANDROID} && chown android:android ${GSTREAMER_ROOT_ANDROID}

COPY tools/gstreamer-sdk.sh /opt/tools/

RUN /opt/tools/gstreamer-sdk.sh

