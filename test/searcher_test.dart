import 'package:searcher/searcher.dart';
import 'package:test/test.dart';

void main() {
  /// This test suite verifies the functionality of various searching algorithms
  /// provided by the `searcher` package.
  group('Search Tests', () {
    test('Binary Search', () {
      /// Tests the `BinarySearch.search` method for a sorted list of integers.
      final list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      final target = 7;
      final result = BinarySearch.search(list, target);

      expect(result.index, 6);
    });

    test('Linear Search', () {
      /// Tests the `linearSearch` function for a list of mixed data types.
      final List<dynamic> list2 = ['apple', 'banana', 'cherry', 10, 20, 30];
      final target2 = 'cherry';

      Map<String, dynamic> result2 = linearSearch(list2, target2);

      expect(result2['index'], 2);
    });

    test('Jump Search', () {
      /// Tests the `jumpSearch` function for a list of mixed data types.
      final List<dynamic> list3 = [
        10,
        20,
        30,
        40,
        50,
        'apple',
        'banana',
        'cherry'
      ];
      final target3 = 'banana';

      final Map<String, dynamic> result3 = jumpSearch(list3, target3);

      expect(result3['index'], 6);
    });
  });
}
