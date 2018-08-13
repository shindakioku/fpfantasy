import './list/flattenList.dart';

bool isNull<T>(T a) => a == null;

bool isNotNull<T>(T a) => !isNull(a);

bool eqBy<T>(Function(T) f, T a, T b) => f(a) == f(b);

bool equals<T>(T a, T b) {
  if (a is String || a is int || a is double) return a == b;

  // b is List because you must write (b as List) for second variable
  if (a is List && b is List) {
    if (a.length != b.length) return false;

    var first = flattenList(a);
    var second = flattenList(b);

    for (var i = 0; i < first.length; i++) {
      if (first[i] != second[i]) {
        return false;
      }
    }

    return true;
  }

  return false;
}
