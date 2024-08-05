import 'dart:core';

/// Performs a linear search on a list to find the index of a target element.
///
/// The function accepts a list of either strings or integers and a target element to search for.
/// If the target exists in the list, the function returns its index; otherwise, it returns -1.
/// The function also returns the time taken for the search. If the time is less than 0 milliseconds,
/// it shows the time in microseconds.
///
/// [list] - The list of elements (either strings or integers) to search within.
/// [target] - The element (string or integer) to search for in the list.
///
/// Returns a map containing:
/// - 'index': The index of the target element if found, otherwise -1.
/// - 'time': The time taken for the search, displayed in microseconds if less than 0 milliseconds.
Map<String, dynamic> linearSearch(List<dynamic> list, dynamic target) {
  // Ensure the list is not empty and target is either String or int
  if (list.isEmpty || (target is! String && target is! int)) {
    throw ArgumentError(
        'The list must not be empty and target must be either a String or an int.');
  }

  // Record the start time
  final stopwatch = Stopwatch()..start();

  // Perform linear search
  for (int i = 0; i < list.length; i++) {
    if (list[i] == target) {
      stopwatch.stop();
      final elapsed = stopwatch.elapsedMicroseconds;
      return {
        'index': i,
        'time': elapsed < 1000
            ? '$elapsed microseconds'
            : '${elapsed / 1000} milliseconds',
      };
    }
  }

  // If target is not found
  stopwatch.stop();
  final elapsed = stopwatch.elapsedMicroseconds;
  return {
    'index': -1,
    'time': elapsed < 1000
        ? '$elapsed microseconds'
        : '${elapsed / 1000} milliseconds',
  };
}
