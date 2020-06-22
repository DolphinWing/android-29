FROM dolphinwing/android-build:ndk-r17c

ENV GSTREAMER_ROOT_ANDROID /opt/gstreamer-1.0-android

RUN mkdir -p ${GSTREAMER_ROOT_ANDROID} && chown android:android ${GSTREAMER_ROOT_ANDROID}

COPY tools/gstreamer-sdk.sh /opt/tools/

RUN /opt/tools/gstreamer-sdk.sh

# Install required tools
RUN apt update && apt install -y python3 sudo python3-pip && pip3 install pybadges

#RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
#USER docker
#WORKDIR /home/docker
RUN echo "android:android" | chpasswd && adduser android sudo
USER android
WORKDIR /home/android

RUN cat /opt/tools/.docker-prompt >> .bashrc && echo 'android' | sudo -S cp /opt/tools/.*rc .

CMD /bin/bash
