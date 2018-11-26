import './list/flattenList.dart';
import './map/flattenMap.dart';

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
