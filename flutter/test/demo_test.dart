import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

class Book {
  String title;
  Book({required this.title});
}

class ComicBook extends Book {
  ComicBook({required super.title});
}

void main() {
  // final books = List.filled(3, Book(title: "Hi"));
  List<Book> books =
      List.generate(1, (index) => ComicBook(title: "$index"), growable: false);

  final String sentence = "one two two three three three";
  final List<String> words = sentence.split(' ');
  Map<String, int> map = {};
  final maxElement = books.reduce((maximum, element) => element > max)
  // for (var word in words) {
  //   map[word] = map.putIfAbsent(word, () => 0) + 1;
  // }
  // for (final word in words) {
  //   map[word] = map.putIfAbsent(word, () => 0) + 1;
  // }
  map.forEach((key, value) {});
}
