
## Array 
| Common Operation           | Syntax                                             | Notes                         |
| :--------------------------| :--------------------------------------------------| :-----------------------------|
| Add| `add`, `addAll`, `followedBy`, `insert`, `insertAll` |                               |
| Remove          | `removeAt`, `removeRange`,`remove`, `removeWhere`,`removeLast`, `skip`, `skipWhile`, `clear` |  |
| Find | `indexOf`, `lastIndexOf`, `indexWhere`, `lastIndexWhere`, `firstWhere`, `lastWhere`  | Returns `-1` if not found    |
| Check            | `contains`, `any`, `every`                         |                               |
| Filter           | `where`, `retainWhere`, `nonNulls`, `whereType`, `take`, `takeWhile` | `where` returns a new list   |
| Transform                  | `map`                                              |                               |
| Accumulate                 | `reduce`, `fold`                                   |                               |
| Flatten                    | `expand`                                           |                               |

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
