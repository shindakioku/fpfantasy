import '../equals.dart';

List flattenList<T>(List<T> data, [dynamic f(T)]) {
  var result = [];

  data.forEach((v) {
    if (v is List) {
      result.addAll(flattenList(v));
    } else {
      if (isNull(f)) {
        result.add(v);
      } else {
        result.add(f(v));
      }
    }
  });

  return result;
}
