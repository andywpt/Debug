## Contents
### Project
- [設定 Flutter 使用的 Java 版本](設定-flutter-使用的-java-版本)

## 設定 Flutter 使用的 Java 版本
> [!WARNING]
> 若因為Java 版本不相容所導致build error，其 error message 通常也不會提示是因為Java版本的問題 💀
> <details>
>  <summary>錯誤訊息</summary>
>  <img width="982" alt="Screenshot 2025-01-09 at 12 07 14 AM" src="https://github.com/user-attachments/assets/ab5c5d62-a2db-4edb-80fb-bee16575637c" />
>  </details>

- `flutter doctor -v` 查看 Android toolchain 的 Java version 欄位
- flutter預設會用Android Studio內部的Java版本，要更改java版本用 **flutter config --jdk-dir**
  
  ```
  jenv local 17
  flutter config --jdk-dir $JAVA_HOME
  ```
  <details>
  <summary>對比圖</summary>
  <img width="1045" alt="CleanShot 2025-01-08 at 00 28 42@2x" src="https://github.com/user-attachments/assets/cd54e76e-ad10-4965-82b1-fb81a63329aa" />
  <img width="927" alt="CleanShot 2025-01-08 at 00 30 21@2x" src="https://github.com/user-attachments/assets/9220db36-cd26-4229-a3a6-99511e35b5db" />
  </details>
 
  <details>
  <summary>用 jenv 選擇 Java 版本並同時更新 $JAVA_HOME</summary>
    
  `brew install jenv` 安裝 jenv
  
  `brew install openjdk@17` 安裝 java 17
  
  在 .zshrc 添加
  ```
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
  jenv enable-plugin export   // 同時更新 $JAVA_HOME
  export JAVA_HOME=$(jenv javahome) // 同時更新 $JAVA_HOME?
  ```
  指令
  ```
  # Add Java version to jenv (ex: Java 17)
  jenv add /opt/homebrew/opt/openjdk@17/1ibexec/openjdk.jdk/Contents/Home

  # All added Java versions
  jenv versions

  # Set global Java version
  jenv global 17.0

  # Set local Java version (for a specific project)
  jenv local 17.0

  # Current Java version
  java -version (jenv version)

  # Debug
  jenv doctor
  ```
  </details>

 
