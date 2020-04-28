#!/bin/bash

GST_VERSION=1.16.2
GST_TARGET="gstreamer-1.0-android-universal-${GST_VERSION}"
GST_TAR_XZ="${GST_TARGET}.tar.xz"

export GSTREAMER_SDK_ROOT=/opt/gstreamer-1.0-android

cd $GSTREAMER_SDK_ROOT

#rm -rf ${GST_TARGET}
if [ -f ${GST_TAR_XZ} ]; then
  echo "SDK Tools already bootstrapped. Skipping initial setup"
  #tar -xvf ${GST_TAR_XZ}
else
  echo "Bootstrapping SDK-Tools"
  wget https://gstreamer.freedesktop.org/data/pkg/android/${GST_VERSION}/${GST_TAR_XZ}
  tar -xvf ${GST_TAR_XZ}
fi

rm -f ${GST_TAR_XZ}
