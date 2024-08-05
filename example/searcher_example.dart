import 'package:searcher/searcher.dart';

void main() {
  /// BINARY SEARCH USAGE
  final list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final target = 7;
  final result = BinarySearch.search(list, target);
  print('$result');
  // Index: 6, Time: some microseconds

  /// LINEAR SEARCH USAGE
  final List<dynamic> list2 = ['apple', 'banana', 'cherry', 10, 20, 30];
  final target2 = 'cherry';

  Map<String, dynamic> result2 = linearSearch(list2, target2);

  print('Index: ${result2['index']}, Time: ${result2['time']}');
  // Index: 2, Time: 14 microseconds

  /// JUMP SEARCH USAGE
  final List<dynamic> list3 = [10, 20, 30, 40, 50, 'apple', 'banana', 'cherry'];
  final target3 = 'banana';

  final Map<String, dynamic> result3 = jumpSearch(list3, target3);

  print('Index: ${result3['index']}, Time: ${result3['time']}');
  // Index: 6, Time: 654 microseconds
}
