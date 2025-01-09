# iOS

## Code Signing 流程
### IPA (iOS AppStore Package)

.ipa 檔是一種基於 ZIP 格式的壓縮檔，裡頭包含：
- 編譯過後的應用程式執行檔 (App Binary)
- 數位簽名: 用來檢查應用程式執行檔有沒有被竄改過
- Provisioning Profile：含有解密數位簽名所須的公鑰
- Info.plist
- 資源檔案: 圖片、字體、聲音等等

> [!NOTE]
> 從App Store下載的ipa中沒有 provisioning profile，因為它們在上架前已經被蘋果簽署並驗證

### 數位簽名(Code Signature)
- 如何產生?  將App Binary的摘要（Hash 值）用開發者的私鑰加密而產生(該加密過程稱為Code Signing)。Xcode使用codesign tool來Code Sign，所以簽署时，codesign會請求使用你的私鑰權限
- 用途? 數位簽名可以使用對應的公鑰來解密，得到原始的摘要。如果解密後得到的摘要和應用程式重新計算的Hash值一致，代表應用程式在發佈後內容沒有被修改過。

### 私鑰、公鑰
當開發者在 Mac 電腦上生成證書簽名請求（CSR）時，電腦會生成一對私鑰和公鑰，私鑰會保存在電腦的 Keychain中，公鑰則會附在證書簽名請求中，並發送給蘋果。
蘋果收到證書簽名請求後，會根據其中的公鑰和開發者的資訊來生成.cer 數位證書，然後返回給開發者。

### 數位證書
iOS開發中常見的數位證書格式有 .cer 與 .p12 兩種:
- cer 檔: 由開發者網站下載而來，其包含公鑰(用來驗證簽署的應用程式)、開發者帳戶信息、數位簽名(由蘋果簽署，用來驗證證書本身，可以用蘋果裝置內的公鑰解開)
- p12 檔 = 由本地電腦Keychain輸出而來，其中包含私鑰和 .cer 檔

### Provisioning Profile
用來管控應用程式在裝置上運行的檔案，裡面信息包含：
- 用來簽署應用程式的數位證書
- 可以簽署哪些 App ID
- 可以安裝該應用程式的裝置ID

### iPhone如何驗證應用程式
IPA 檔案包含Provisioning Profile與App Binary，首先，iPhone 使用裝置內的公鑰來驗證Provisioning Profile裡的數位證書。接著，再用這個數位證書中的公鑰來驗證App Binary (這個連鎖機制稱為Chain of trust)

### 流程圖
![CleanShot 2025-01-09 at 10 42 51@2x](https://github.com/user-attachments/assets/99bf5fff-d1a8-402b-a3d6-ec9334539c0e)

### 參考連結
- [Inside Code Signing: Provisioning Profiles](https://developer.apple.com/documentation/technotes/tn3125-inside-code-signing-provisioning-profiles)
- [A Beginner’s Guide to Code Signing in iOS Development](https://medium.com/@bingkuo/a-beginners-guide-to-code-signing-in-ios-development-d3d5285f0960)
