import '../equals.dart';

Map flattenMap<K, V>(Map<K, V> data, [Map f(K, V)]) {
  var result = {};

  data.forEach((k, v) {
    if (v is Map) {
      result.addAll(flattenMap(v));
    } else {
      if (isNull(f)) {
        result.addAll({k: v});
      } else {
        result.addAll(f(k, v));
      }
    }
  });

  return result;
}
