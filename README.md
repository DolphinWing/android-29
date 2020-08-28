# Docker for Android SDK 30

Docker for Android SDK 30 with preinstalled build tools

> Edit from [mindrunner/docker-android-sdk](https://github.com/mindrunner/docker-android-sdk)

**Installed Packages**
```bash
# sdkmanager --list
  Path                              | Version | Description                       | Location
  -------                           | ------- | -------                           | -------
  build-tools;30.0.2                | 30.0.2  | Android SDK Build-Tools 30.0.2    | build-tools/30.0.2/
  platform-tools                    | 30.0.4  | Android SDK Platform-Tools        | platform-tools/
  platforms;android-30              | 2       | Android SDK Platform 30           | platforms/android-30/
  tools                             | 26.1.1  | Android SDK Tools 26.1.1          | tools/
```

**Usage**

- Interactive way
  ```bash
  $ docker run -it --rm --privileged dolphinwing/android-build:latest bash
  # enable color prompt
  $ source ~/.docker-prompt
  # check installed packages
  $ sdkmanager --list
  # You can also run other Android platform tools, which are all added to the PATH environment variable
  ```

  To connect the emulator using `adb` on the docker host machine, start the container with `--net=host`.
  You could also use [`scrcpy`](https://github.com/Genymobile/scrcpy) to do a screencast of the emulator.

- Non-interactive way
  ```bash
  # check installed packages
  $ docker run -it --rm dolphinwing/android-build:latest sdkmanager --list
  # You can also run other Android platform tools, which are all added to the PATH environment variable
  ```
