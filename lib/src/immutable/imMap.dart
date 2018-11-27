import '../map/generate.dart';
import '../equals.dart';

/// Use this extend http://github.com/fpdart/immutables/
/// @Deprecated('Will be removed')
class ImMap<K, V> {
  Map<K, V> _data = {};

  Map<K, V> get data => _data;

  ImMap([this._data]);

  ImMap.fromList(List v, [Map<K, V> f(List)]) {
    _data = isNull(f) ? withValues(v) : f(v);
  }

  ImMap.of(Map<K, V> other) {
    _data = other;
  }

  bool containsKey(Object key) => _data.containsKey(key);

  bool containsValue(Object value) => _data.containsValue(value);

  void where(Map<K, V> f(K, V)) {
    _data.forEach((k, v) => f(k, v));
  }

  ImMap<K2, V2> map<K2, V2>(Map<K2, V2> f(K, V)) {
    var result = {};

    where((k, v) {
      result.addAll(f(k, v));
    });

    return new ImMap(result);
  }

  ImMap<K2, V2> takeWhere<K2, V2>(bool predicate(K, V)) {
    var result = {};

    where((k, v) {
      if (predicate(k, v)) {
        result.addAll({k: v});
      }
    });

    return new ImMap(result);
  }

  ImMap<K2, V2> removeWhere<K2, V2>(bool predicate(K, V)) {
    var result = {};

    where((k, v) {
      if (!predicate(k, v)) {
        result.addAll({k: v});
      }
    });

    return new ImMap(result);
  }

  ImMap add<K2, V2>(V2 value, [K2 key]) {
    if (isNull(key)) {
      return new ImMap({}..addAll(_data)..addAll({_data.length: value}));
    }

    return new ImMap({}..addAll(_data)..addAll({key: value}));
  }

  V operator [](Object key) {
    if (_data.containsKey(key)) return _data[key];

    return null;
  }

  void operator []=(K key, V value) {
    throw new Exception('Cannot modify');
  }

  ImMap operator +(value) {
    if (value is Map) return new ImMap({}..addAll(_data)..addAll(value));

    return new ImMap({}..addAll(_data)..addAll({_data.length: value}));
  }

  ImMap operator -(value) {
    if (value is Map) {
      return removeWhere(
          (k, v) => k == value.keys.first && v == value.values.first);
    }

    return removeWhere((k, v) => k == value || k == value);
  }
}
