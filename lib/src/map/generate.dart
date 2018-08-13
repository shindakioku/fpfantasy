Map<int, int> generate(int index) => List.generate(index, (_) => _).asMap();

Map<K, V> fromValues<K, V>(List values) =>
    withCallback(values, (_, v) => {v: v});

Map<K, V> withValues<K, V>(List values) =>
    withCallback(values, (i, v) => {i: v});

Map<K, V> withCallback<K, V>(List values, Map callback(Int, V /* dynamic */)) {
  var result = {};

  for (var i = 0; i < values.length; i++) {
    result.addAll(callback(i, values[i]));
  }

  return result;
}
