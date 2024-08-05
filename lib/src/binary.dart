import 'dart:core';

/// A class that provides a binary search method.
class BinarySearch {
  /// Performs a binary search on a sorted list of [Comparable] items.
  ///
  /// The [list] should be sorted in ascending order for the binary search
  /// to work correctly. The [target] is the item to search for.
  ///
  /// If the [target] is found in the [list], the method returns its index.
  /// Otherwise, it returns -1.
  ///
  /// Additionally, the method returns the time taken to perform the search.
  ///
  /// Example usage:
  /// ```dart
  /// var list = [1, 2, 3, 4, 5];
  /// var target = 3;
  /// var result = BinarySearch.search(list, target);
  /// print('Index: ${result.index}, Time: ${result.time}ms');
  /// ```
  ///
  /// Returns a [SearchResult] object containing the index of the [target]
  /// and the time taken to perform the search in milliseconds.
  static SearchResult search(List<Comparable> list, Comparable target) {
    final stopwatch = Stopwatch()..start();
    int left = 0;
    int right = list.length - 1;

    while (left <= right) {
      int middle = left + ((right - left) >> 1);
      if (list[middle] == target) {
        stopwatch.stop();
        int elapsedTime = stopwatch.elapsedMilliseconds;
        if (elapsedTime == 0) {
          return SearchResult(
              index: middle, timeMicroseconds: stopwatch.elapsedMicroseconds);
        }
        return SearchResult(index: middle, timeMilliseconds: elapsedTime);
      } else if (list[middle].compareTo(target) < 0) {
        left = middle + 1;
      } else {
        right = middle - 1;
      }
    }

    stopwatch.stop();
    int elapsedTime = stopwatch.elapsedMilliseconds;
    if (elapsedTime == 0) {
      return SearchResult(
          index: -1, timeMicroseconds: stopwatch.elapsedMicroseconds);
    }
    return SearchResult(index: -1, timeMilliseconds: elapsedTime);
  }
}

/// A class representing the result of a binary search.
class SearchResult {
  /// The index of the target in the list, or -1 if the target was not found.
  final int index;

  /// The time taken to perform the search in milliseconds.
  final int? timeMilliseconds;

  /// The time taken to perform the search in microseconds.
  final int? timeMicroseconds;

  /// Creates a [SearchResult] with the given [index] and [time].
  SearchResult(
      {required this.index, this.timeMilliseconds, this.timeMicroseconds});

  @override
  String toString() {
    if (timeMilliseconds != null) {
      return 'Index: $index, Time: $timeMilliseconds milliseconds ';
    } else {
      return 'Index: $index, Time: $timeMicroseconds microseconds';
    }
  }
}
