var chainList = (List d) => new ChainList(d);

var chainMap = (Map d) => new ChainMap(d);

class ChainList<T> {
  List<T> _data = [];

  ChainList(this._data);

  ChainList<T> c<T2>(f(T)) {
    var d = <T2>[];

    _data.forEach((v) => d.add(f(v)));

    _data = d as List<T>;

    return this;
  }

  List<T> result() => _data;
}

class ChainMap<K, V> {
  Map<K, V> _data = {};

  ChainMap(this._data);

  ChainMap<K, V> c(f(V)) {
    var d = {};

    _data.forEach((k, v) => d.addAll({k: f(v)}));

    _data = d;

    return this;
  }

  Map<K, V> result() => _data;
}
