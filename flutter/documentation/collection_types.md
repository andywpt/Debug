# Collection Types
<details>
  <summary>How to cast</summary>

  Collections in Dart are invariant, `List<SubClass>` != `List<SuperClass>`
  ```dart
  class ComicBook extends Book {}
  List<Book> books = [ Comicbook() ];
  // Always false 
  print(books is List<Comicbook>) 

  // Always throws
  List<Comicbook> comicBooks = books as List<Comicbook>;

  // Correct, but will throw runtime error if element is not a ComicBook
  List<Comicbook> comicBooks = books.cast<ComicBook>();

  // Safer way
  if (books.every((book) => book is ComicBook)) {
    List<Comicbook> comicBooks = books.cast<Comicbook>();
  }
  ```
</details>

## List (Array)
<details>
  <summary>How to initialize a list</summary>
</details>
<details>
  <summary>How to initialize a list</summary>
</details>


<details>
  <summary>初始化</summary>
</details>
- Violating fixed-length, unmodifiable rules will throw runtime error instead of compile error
- List methods
  + Some methods (ex: `map`) return an Iterable instead of a List for performace reasons (Use `toList()` to convert Iterable into List)
  + Some methods or property will throw, beware!
  
    | 常用操作 | 語法   | Notes |
    | :-------| :------| :-----|
    | 初始化      | **List.filled**, **List.generate**, **List.from**, **List.unmodifiable** |  |
    | 加入元素    | **add**, **addAll**, **followedBy**, **insert**, **insertAll** | |
    | 移除元素    | **removeAt**, **removeRange**, **remove**, **removeWhere**, **removeLast**, **skip**, **skipWhile**, **clear** | |
    | 只要某些元素 | **where**, **retainWhere**, **nonNulls**, **whereType**, **take**, **takeWhile**, **subList**  | **where** returns a new list |
    | 尋找元素    | **indexOf**, **lastIndexOf**, **indexWhere**, **lastIndexWhere**, **firstWhere**, **lastWhere** | Returns **-1** if not found  |
    | 檢查 | **contains**, **any**, **every**, **isEmpty** ||
    | Iterate | **forEach** | |
    | Transform | **map** | |
    | Accumulate | **reduce**, **fold** | |
    | Flatten | **expand** | |
