#!/bin/bash

CPATH=/opt/tools #`pwd`
#export ANDROID_HOME=/opt/android-sdk-linux
#export ANDROID_SDK_ROOT=${ANDROID_HOME}
#export ANDROID_SDK_HOME=${ANDROID_HOME}
#export ANDROID_SDK=${ANDROID_HOME}
#export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
#export PATH=${PATH}:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/cmdline-tools/bin:${ANDROID_HOME}/bin:

cd ${ANDROID_HOME}
echo "Set ANDROID_HOME to ${ANDROID_HOME}"

if [ -f sdk-tools-linux.zip ]
then
  echo "SDK Tools already bootstrapped. Skipping initial setup"
else
  echo "Bootstrapping SDK-Tools"
  wget -q https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip -O sdk-tools-linux.zip
  unzip sdk-tools-linux.zip
fi

echo "Make sure repositories.cfg exists"
mkdir -p ~/.android/
touch ~/.android/repositories.cfg

echo "Updating SDK"
$CPATH/android-accept-licenses.sh "${ANDROID_HOME}/cmdline-tools/bin/sdkmanager --sdk_root=${ANDROID_HOME} --update --verbose"

echo "Accepting Licenses"
$CPATH/android-accept-licenses.sh "${ANDROID_HOME}/cmdline-tools/bin/sdkmanager --sdk_root=${ANDROID_HOME} --licenses --verbose"

rm -f sdk-tools-linux.zip
