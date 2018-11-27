import './ap.dart';

/**
 * Calls each functions for each value in the list.
 * 
 *      chainList(<int>[1, 2, 3])
 *        .c((int v) => v + 1)
 *        .c((int v) => v * 2)
 *        .result(); // 4, 6, 8
 * 
 */
var chainList = <T>(List<T> d) => new ChainList<T>(d);

/**
 * Calls each functions for each value in the list.
 * 
 *      chainMap(int, int>{0: 1, 1: 2, 2: 3})
 *        .c((int v) => v + 1)
 *        .c((int v) => v * 2)
 *        .result(); // {0: 4, 1: 6, 2: 8}
 * 
 */
var chainMap = <K, V>(Map<K, V> d) => new ChainMap<K, V>(d);

abstract class _Base<F, T> {
  T _data;
  List<F> _functions = [];

  _Base(this._data);

  _Base<F, T> c(F f) {
    _functions.add(f);

    return this;
  }

  result();
}

class ChainList<T> extends _Base<dynamic Function(T _), List<T>> {
  ChainList(List<T> _) : super(_);

  result() => ap(_functions, _data);
}

class ChainMap<K, V> extends _Base<dynamic Function(V _), Map<K, V>> {
  ChainMap(Map<K, V> _) : super(_);

  result() =>
      _functions.fold(_data, (map, f) => map.map((k, v) => MapEntry(k, f(v))));
}
