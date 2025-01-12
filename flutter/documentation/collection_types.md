
## Array 
``` dart
List<int> numbers = [1,2,3,4,5];

// 移除全部
numbers.clear();
var didRemoveFirst = numbers.remove(1);
numbers.removeAt(index)



```
| Common Operation           | Syntax                                             | Notes                         |
| :--------------------------| :--------------------------------------------------| :-----------------------------|
| Find index from start (end) | `indexOf`, `lastIndexOf`, `indexWhere`, `lastIndexWhere` | Returns `-1` if not found    |
| Find element from start (end) | `firstWhere`, `lastWhere`                         | Throws if not found           |
| Check element              | `contains`, `any`, `every`                         |                               |
| Filter elements            | `where`, `retainWhere`, `nonNulls`, `whereType`, `take`, `takeWhile` | `where` returns a new list   |
| Add single (multiple) element(s) | `add`, (`addAll`, `followedBy`)                  |                               |
| Insert single (multiple) element(s) | `insert`, (`insertAll`)                         |                               |
| Remove elements            | `remove`, `removeWhere`,`removeLast`, `skip`, `skipWhile`       |                               |
| Remove elements within range | `removeAt`, `removeRange`                          |                               |
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