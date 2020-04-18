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
  tools                             | 26.0.1  | Android SDK Tools 26.0.1          | tools/
```

**Usage**

- Interactive way
  ```bash
  $ docker run -it --rm --privileged androidsdk/android-29:latest bash
  # check installed packages
  $ sdkmanager --list
  # You can also run other Android platform tools, which are all added to the PATH environment variable
  ```

  To connect the emulator using `adb` on the docker host machine, start the container with `--net=host`.
  You could also use [`scrcpy`](https://github.com/Genymobile/scrcpy) to do a screencast of the emulator.

- Non-interactive way
  ```bash
  # check installed packages
  $ docker run -it --rm androidsdk/android-29:latest sdkmanager --list
  # You can also run other Android platform tools, which are all added to the PATH environment variable
  ```
