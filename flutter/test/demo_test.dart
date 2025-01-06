import 'package:flutter_test/flutter_test.dart';

void main() {
  final List<int> numbers = [11, 12, 13, 14, 15];

  for (final num in numbers) {}

  numbers.asMap().entries.forEach((entry) {
    print("key: ${entry.key} value: ${entry.value}");
  });
  Map<String, int> hashMap = {};
  hashMap['c'] = 3;
  hashMap['a'] = 1;
  hashMap['b'] = 2;

  for (var entry in hashMap.entries) {
    print('${entry.key}: ${entry.value}');
  }
  // group('1+1=2', () {
  //   test('addition test', () {
  //     expect(1 + 1, 2);
  //   });
  // });
}
