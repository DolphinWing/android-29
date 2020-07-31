# Docker for Android SDK 29

Docker for Android SDK 29 with preinstalled build tools

> Edit from [mindrunner/docker-android-sdk](https://github.com/mindrunner/docker-android-sdk)

**Installed Packages**
```bash
# sdkmanager --list
  Path                              | Version | Description                       | Location
  -------                           | ------- | -------                           | -------
  build-tools;29.0.3                | 29.0.3  | Android SDK Build-Tools 29.0.3    | build-tools/29.0.3/
  platform-tools                    | 29.0.6  | Android SDK Platform-Tools        | platform-tools/
  platforms;android-29              | 4       | Android SDK Platform 29           | platforms/android-29/
  tools                             | 26.1.1  | Android SDK Tools 26.1.1          | tools/
  ndk;21.3.6528147                  | r21d    | NDK 21.3.6528147                  | ndk/21.3.6528147/
  cmake;3.6.4111459                 | 3.6     | CMake 3.6.4111459                 | cmake/3.6.4111459/
```
**GStreamer 1.16.2**
```bash
# ls -l /opt/gstreamer-1.16.2
total 16
drwxr-xr-x 7 root root 4096  一   7 13:36 arm64
drwxr-xr-x 7 root root 4096  一   7 13:36 armv7
drwxr-xr-x 7 root root 4096  一   7 13:36 x86
drwxr-xr-x 7 root root 4096  一   7 13:37 x86_64
```

**Usage**

- Interactive way
  ```bash
  $ docker run -it --rm --privileged dolphinwing/android-build:gstreamer-latest bash
  # enable color prompt
  $ source /opt/tools/.docker-prompt
  # check installed packages
  $ sdkmanager --list
  # You can also run other Android platform tools, which are all added to the PATH environment variable
  ```

  To connect the emulator using `adb` on the docker host machine, start the container with `--net=host`.
  You could also use [`scrcpy`](https://github.com/Genymobile/scrcpy) to do a screencast of the emulator.

- Non-interactive way
  ```bash
  # check installed packages
  $ docker run -it --rm dolphinwing/android-build:gstreamer-latest sdkmanager --list
  # You can also run other Android platform tools, which are all added to the PATH environment variable
  ```
