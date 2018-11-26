import './ap.dart';

var chainList = <T>(List<T> d) => new ChainList<T>(d);

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
