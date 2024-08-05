# searcher

`searcher` is a Dart package that provides implementations for various search algorithms including Binary Search, Linear Search, and Jump Search. These algorithms can be used to search for elements in lists efficiently.

## Features

- **Binary Search**: Efficiently finds the position of a target value within a sorted array.
- **Linear Search**: Sequentially checks each element of the list until the target value is found.
- **Jump Search**: Searches for an element by jumping ahead by fixed steps and then performing a linear search within a block.

## Installation

Add `searcher` as a dependency in your `pubspec.yaml` file:

```
dependencies:
  searcher: ^1.0.0
```

Then, run `flutter pub get` or `dart pub get` to install the package.

# Usage
Here's how to use the search algorithms provided by the `searcher` package:

## Binary Search
```
  final list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final target = 7;
  final result = BinarySearch.search(list, target);
  print('$result');
  // Index: 6, Time: some microseconds
```

## Linear Search
```
final List<dynamic> list2 = ['apple', 'banana', 'cherry', 10, 20, 30];
  final target2 = 'cherry';

  Map<String, dynamic> result2 = linearSearch(list2, target2);

  print('Index: ${result2['index']}, Time: ${result2['time']}');
  // Index: 2, Time: 14 microseconds
```

## Jump Search
```
final List<dynamic> list3 = [10, 20, 30, 40, 50, 'apple', 'banana', 'cherry'];
  final target3 = 'banana';

  final Map<String, dynamic> result3 = jumpSearch(list3, target3);

  print('Index: ${result3['index']}, Time: ${result3['time']}');
  // Index: 6, Time: 654 microseconds
```


# Contributions
#### Contributions are welcome! Please open an issue or submit a pull request for any changes or enhancements.