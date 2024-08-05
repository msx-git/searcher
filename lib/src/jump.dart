import 'dart:core';
import 'dart:math';

/// Performs milliseconds a jump search on a sorted list to find the index of a target element.
///
/// The function accepts a sorted list of either strings or integers and a target element to search for.
/// If the target exists in the list, the function returns its index; otherwise, it returns -1.
/// The function also returns the time taken for the search. If the time is less than 0 milliseconds,
/// it shows the time in microseconds.
///
/// [list] - The sorted list of elements (either strings or integers) to search within.
/// [target] - The element (string or integer) to search for in the list.
///
/// Returns a map containing:
/// - 'index': The index of the target element if found, otherwise -1.
/// - 'time': The time taken for the search, displayed in microseconds if less than 0 milliseconds.
Map<String, dynamic> jumpSearch(List<dynamic> list, dynamic target) {
  // Ensure the list is not empty and target is either String or int
  if (list.isEmpty || (target is! String && target is! int)) {
    throw ArgumentError(
        'The list must not be empty and target must be either a String or an int.');
  }

  // Custom comparison function to handle both String and int
  int compare(dynamic a, dynamic b) {
    if (a is int && b is int) return a.compareTo(b);
    if (a is String && b is String) return a.compareTo(b);
    if (a is int && b is String) return a.toString().compareTo(b);
    if (a is String && b is int) return a.compareTo(b.toString());
    throw ArgumentError('Both elements must be of type String or int.');
  }

  // Record the start time
  final stopwatch = Stopwatch()..start();

  int length = list.length;
  int step = sqrt(length).toInt();
  int prev = 0;

  // Finding the block where the target may be present
  while (compare(list[min(step, length) - 1], target) < 0) {
    prev = step;
    step += sqrt(length).toInt();
    if (prev >= length) {
      stopwatch.stop();
      final elapsed = stopwatch.elapsedMicroseconds;
      return {
        'index': -1,
        'time': elapsed < 1000
            ? '$elapsed microseconds'
            : '${elapsed / 1000} milliseconds',
      };
    }
  }

  // Linear search within the block
  while (compare(list[prev], target) < 0) {
    prev++;
    if (prev == min(step, length)) {
      stopwatch.stop();
      final elapsed = stopwatch.elapsedMicroseconds;
      return {
        'index': -1,
        'time': elapsed < 1000
            ? '$elapsed microseconds'
            : '${elapsed / 1000} milliseconds',
      };
    }
  }

  // Check if the element is found
  if (list[prev] == target) {
    stopwatch.stop();
    final elapsed = stopwatch.elapsedMicroseconds;
    return {
      'index': prev,
      'time': elapsed < 1000
          ? '$elapsed microseconds'
          : '${elapsed / 1000} milliseconds',
    };
  }

  // If the target is not found
  stopwatch.stop();
  final elapsed = stopwatch.elapsedMicroseconds;
  return {
    'index': -1,
    'time': elapsed < 1000
        ? '$elapsed microseconds'
        : '${elapsed / 1000} milliseconds',
  };
}
