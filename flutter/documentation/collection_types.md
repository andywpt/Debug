
## Array 
| 常見操作  | 語法 | Notes |
| :-------| :---| :-----|
| 加入元素  | **add**, **addAll**, **followedBy**, **insert**, **insertAll** | |
| 移除元素  | **removeAt**, **removeRange**, **remove**, **removeWhere**, **removeLast**, **skip**, **skipWhile**, **clear** |  |
| 只要某些元素 | **where**, **retainWhere**, **nonNulls**, **whereType**, **take**, **takeWhile**, **subList** | **where** returns a new list |
| 尋找元素    | **indexOf**, **lastIndexOf**, **indexWhere**, **lastIndexWhere**, **firstWhere**, **lastWhere** | Returns **-1** if not found  |
| Check                      | **contains**, **any**, **every**                   |                               |
| Transform                  | **map**                                            |                               |
| Accumulate                 | **reduce**, **fold**                               |                               |
| Flatten                    | **expand**                                         |                               |

| Swift  | Dart   | Remark |
| :----| :---- | :---- |
| **Get** | | |
| suffix(maxLength)  | x                   |   |
| prefix(maxLength)  | x                   |   |
| **Remove** |
| x               | remove | Removes the first occurrence of value from the list  | |
| removeFirst()           | x                   |   |
| removeFirst(_: Int)     | x                   |
| removeLast              | removeLast [throw]  |
| removeLast(_: Int)      | x                   |
| removeAll(where:)       | removeWhere         |
| removeAll()             | clearAll            |   |
| **Transform**
| map                     | map                 |
| filter                  | retainWhere         |   |
| allSatisfy              | every               |   |


| 单元  | 单元格 | 单元格 |
| 单元格 | 单元格 | 单元格 |
