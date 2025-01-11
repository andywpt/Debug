## Contents
### Thread
- Actor
- Task
### App Packaging
- [Code Signing 流程](#code-signing-流程)


## Code Signing 流程
###  IPA (iOS AppStore Package)

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


### BundleID 
用來識別App的ID, 每個App都有一個獨一無二的BundleID，通常為reverse domain name 格式 (com.companyname.appname)

### AppID
當App需要啟用一些蘋果的服務時(通知、Apple登入..)時，需要先註冊，而以AppID為單位去註冊，AppID可以是Explicit App ID (只綁定一個App), 或是 Wildcard App ID是也可綁定多個App

#123
## Relation Between Tasks and Threads
理髮師(Thread) & 客人(Task)

- 理髮師會依客人指示一步步剪頭髮
- 理髮師一次只能幫一位客人剪頭髮，也不能多位理髮師同時幫一位客人剪頭髮，因為有店內有多位理髮師，所以可以同時幫多位客人剪頭髮
- 客人進來的的順序不一定是剪頭髮的順序
- 除非客人自己說要出去講電話，不然該理髮師會負責從頭剪到尾，剪完才會換下一位
- 如果客人剪到一半要暫停出去講電話，那該理髮師會換幫其他客人剪頭髮，該客人回來後，要等其中一位理髮師有空才能繼續剪，而且幫忙剪髮的理髮師不ㄧ定是之前那位，除非客人一開始就有指定給老闆娘剪

### What's a Task?
- When a running task reaches its suspension point (i.e. `await`), the task releases the current thread ,the task will be cached, and the thread running the task is now free to run another task. So `await` inside a Task doesn't block (prevent any other code from running on that thread) the thread, it allows other tasks to make progress.
-  
Swift Concurrency uses a thread pool, with the only shipping exception being MainActor which uses a custom executor to run tasks on the main thread. All other actors, including global actors, use the thread pool
## Quick Reminder 
- **Thread Safe** is a concept that ensures that data is accessed or modified by only one thread at a time.
- 
## Actor
- Actor is a reference type that blocks concurrent access. Because an actor can only be on one thread at any time.
- **can only be on one thread at any time** doesn't imply it sticks to a thread. Only MainActor sticks to a thread (which is the main thread), other actors can run on background threads. An actor can only be on a thread at a time (so there is no concurrent access). But an actor can run on different threads.

### Actors Reentrancy Problem 😈
When an actor's function suspends (i.e. it runs to some line that contains `await`), the actor can process other calls from outside before the function awakes from suspension. So we say actors are **reentrant**.

```
actor Downloader {
    private var count = 0

    func download() async {
        count += 1
        let beforeAwait = count
        await someTask()   // When it suspends, download() can be called many times before it awakes from 
                                 suspension, which causes count to be incremented many times.
        let afterAwait = count
        XCAsertEqual(beforeAwait,afterAwait) ❌ // Assuming unchanged is incorrect 😈 
    }
}
```
#### Why are actors designed to be reentrant?
If actors were not reentrant, all calls to the actor will have to wait for the suspended function, even though the actor is free to do other stuff.

Yes, The actor's internal shared state can change accross the suspension point.
**Solutions**
1. Read and modify before saying any await in the function body
2. Wrap the job into a Task, and store it somewhere, so other code can refer to the task
```
actor TextDownloader {
    private var downloadingTask: Task<String,Never>?
    private var cachedText: String?

    func downloadText() async -> String {
        if let text = cachedText { return text }
        if let task = downloadingTask { return await task.value }
        let newTask = Task {
            let data = await fetchTextFromInternet()
            downloadingTask = nil
            cachedText = data
            return data
        }
        downloadingTask = newTask    // Creates a lock before suspending
        return await newTask.value   // When other code calls downloadData() during this suspension point,
                                     // the downloadingTask is already not nil
    }

    private func fetchTextFromInternet() async -> String {
        print("Fetching from internet...")
        let seconds = 1
        try! await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
        return "Data"
    }
}
```
