FROM dolphinwing/android-build:ndk-r17c

ENV GSTREAMER_ROOT_ANDROID /opt/gstreamer-1.0-android

RUN mkdir -p ${GSTREAMER_ROOT_ANDROID} && chown android:android ${GSTREAMER_ROOT_ANDROID}

COPY tools/gstreamer-sdk.sh /opt/tools/

RUN /opt/tools/gstreamer-sdk.sh

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
USER docker
WORKDIR /home/docker
RUN echo /opt/tools/.docker.prompt >> .bashrc && echo '123456' | sudo -S cp /opt/tools/.*rc .

# Install required tools
RUN apt install -y python3

CMD /bin/bash
