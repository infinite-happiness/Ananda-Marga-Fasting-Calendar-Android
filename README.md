# Ananda Marga Fasting Calendar for Android

This project wraps the web version of the [Ananda Marga Fasting Calendar](https://github.com/infinite-happiness/Ananda-Marga-Fasting-Calendar) 
and works entirely offline without requiring an internet connection.

## Download android APK
Head to [releases](https://github.com/glowinthedark/Ananda-Marga-Fasting-Calendar-Android/releases) to download the latest release APK.

## Build from source

### Requirements

- Java JDK 17 or later, for example, [Eclipse Temurin Java 17 JDK](https://adoptium.net/temurin/releases/)
- [Android Studio](https://developer.android.com/studio)
- `JAVA_HOME` must be configured to point to JDK 17
  - [steps for windows](https://confluence.atlassian.com/doc/setting-the-java_home-variable-in-windows-8895.html)
  - macos: `export JAVA_HOME=$(/usr/libexec/java_home -v 17)` to see available values use `/usr/libexec/java_home -V`
  - linux: `sudo update-alternatives --config java` or explicitly via `export JAVA_HOME=/replace/with/correct/path/to/jdk17`)

Once the requirements are satisfied, verify the correct java JDK version is configured (must be `17` or higher):

```bash
javac --version
``` 

1. Clone the current repository:

```bash
git clone https://github.com/glowinthedark/Ananda-Marga-Fasting-Calendar-Android.git

cd Ananda-Marga-Fasting-Calendar-Android
```

### Build a debug APK

```bash
./gradlew assembleDebug
```

### Build a release APK ( ❗ please read https://developer.android.com/build/build-for-release)
To build a relase APK a release keystore must be created and configured. A new keystore can be created using Android Studio as described below, or from terminal using a command such as the one below (the alias can be any text):

```bash
keytool -genkey -v -keystore keystore.jks -keyalg RSA -keysize 4096 -validity 10000 -alias REPLACE-WITH-YOUR-OWN-ALIAS -storetype JKS
```

#### Build with Android Studio
An easy way to build a release android APK is to use the Android Studio wizard: on the menu pick **`Build`** -> **`Generate Signed App Bundle / APK`** -> **`APK`** -> **Keystore path**: **Create new** and fill in passwords and alias > **Next** select **`release`** -> **`Create`**.

#### Build from terminal

To build a release APK from the terminal the following environment variables must be defined:
| var name | value |
|----------|-------|
`KEYSTORE` |path to the keystore file    
`STORE_PASSWORD` |keystore password
`KEY_PASSWORD` |key password
`KEY_ALIAS` |key alias

Once the variables are set and `KEYSTORE` points to a valid keystore file, issue the following command:

```bash
./gradlew assembleRelease
```

See also:
- [Android Studio: Sign your app](https://developer.android.com/studio/publish/app-signing)
- [How to create a keystore](https://stackoverflow.com/a/15330139)
- [How to set environment variables](https://www3.ntu.edu.sg/home/ehchua/programming/howto/Environment_Variables.html)


## Build using github actions
1. Fork this repository by clicking the **Fork** button in the top right.
2. Click the **Actions** tab
3. In the left-side panel locate and click the **Build APK**.
4. Click the **Run Workflow** and then click **Run Workflow** in the dropdown.

> :exclamation: NOTE: To generate release APK via the github workflow github secrets must configured as described in [Keystore Config
](https://github.com/glowinthedark/Ananda-Marga-Fasting-Calendar-Android/blob/android/how.md)
