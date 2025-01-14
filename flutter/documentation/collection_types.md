
### List (Array)
- Some list methods (ex: `map`) return an Iterable instead of a List for performace reasons (Use toList() to convert Iterable into List)
- Violating fixed-length, unmodifiable rules will throw runtime error instead of compile error
- Collections in Dart are invariant, which means `List<SubClass>` != `List<SuperClass>`
  ```dart
  class ComicBook extends Book {}
  List<Book> books = [ Comicbook() ];
  // Always false 
  print(books is List<Comicbook>) 

  // Always throws
  List<Comicbook> comicBooks = books as List<Comicbook>;

  // Correct, but will throw runtime error if element is not a ComicBook
  List<Comicbook> comicBooks = books.cast<Comicbook>();

  // Safer way
  if (books.every((book) => book is ComicBook)) {
    List<Comicbook> comicBooks = books.cast<Comicbook>();
  }
  ```


| 常用操作    | 語法   | Notes |
| :----------| :------| :-----|
| 初始化      | **List.filled**, **List.generate**, **List.from**, **List.unmodifiable** |  |
| 加入元素    | **add**, **addAll**, **followedBy**, **insert**, **insertAll** | |
| 移除元素    | **removeAt**, **removeRange**, **remove**, **removeWhere**, **removeLast**, **skip**, **skipWhile**, **clear** | |
| 只要某些元素 | **where**, **retainWhere**, **nonNulls**, **whereType**, **take**, **takeWhile**, **subList**  | **where** returns a new list |
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
