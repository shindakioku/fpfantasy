import './list/flattenList.dart';
import './map/flattenMap.dart';

/**
 * Concat your values like [String], [int], [List], [Map].
 * It's works and with nested values, because this function using recursion.
 * 
 *      concat(1, 2); // 12
 *      concat('AB', 'cd'); // ABcd
 *      concat([1, 2], [3, 4]); // [1, 2, 3, 4]
 *      concat({0: 1}, {1: 1}); // {0: 1, 1: 1}
 * 
 */
dynamic concat<T>(dynamic a, dynamic b) {
  if (a is String) return '${a}${b}';

  if (a is int) return int.parse('${a}${b}');

  if (a is List) {
    return []..addAll(flattenList(a))..addAll(flattenList(b));
  }

  if (a is Map) {
    return {}..addAll(flattenMap(a))..addAll(flattenMap(b));
  }

  return null;
}
