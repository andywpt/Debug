# Flutter


## 設定 Java 版本
Step 1. 用 jenv 選擇 Java 版本並使jenv更新 $JAVA_HOME
```
# 安裝 java 17
brew install openjdk@17

# 安裝 jenv
brew install jenv
```
```
# 於 .zshrc 添加
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export JAVA_HOME=$(jenv javahome)
```
```
# Add Java 17.0 to jenv
jenv add /opt/homebrew/opt/openjdk@17/1ibexec/openjdk.jdk/Contents/Home

# Set global Java version
jenv global 17.0

# Set local Java version (for a specific project)
jenv local 17.0

# All installed Java versions
jenv versions

# Current Java version
jenv version

# Current Java version
java -version

# Debug
jenv doctor
```

`flutter config --list` 查看 jdk-dir 欄位

`flutter doctor -v` 查看 Android toolchain 的 Java version 欄位

For mac, use jenv to manage java versions
flutter config --jdk-dir $JAVA_HOME
The Java Development Kit (JDK) installation directory. If unset, flutter will search for one in the following order:
- the JDK bundled with the latest installation of Android Studio,
- the JDK found at the directory found in the JAVA_HOME environment variable, and the directory containing the java binary found in the user's path.
```
A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
