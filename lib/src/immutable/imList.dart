/// Use this extend http://github.com/fpdart/immutables/
/// @Deprecated('Will be removed')
class ImList<E> {
  List<E> _data = [];

  List<E> get data => _data;

  ImList([d]) {
    if (d is List) _data = d;

    if (d is int) _data.length = d;
  }

  factory ImList.generate(int length, E generator(int index)) {
    return new ImList(List.generate(length, generator));
  }

  bool has(E value) {
    for (E e in _data) {
      if (e == value) return true;
    }

    return false;
  }

  void where<E2>(E2 f(E)) {
    _data.forEach((k) => f(k));
  }

  ImList<E2> map<E2>(E2 f(E)) {
    var result = <E2>[];

    where((k) => result.add(f(k)));

    return new ImList(result);
  }

  void forEach<E2>(f(E)) {
    where(f);
  }

  ImList<E2> takeWhere<E2>(bool predicate(E)) {
    var result = <E2>[];

    where((k) {
      if (predicate(k)) result.add(k);
    });

    return new ImList(result);
  }

  ImList<E2> removeWhere<E2>(bool predicate(E)) {
    var result = <E2>[];

    where((k) {
      if (!predicate(k)) {
        result.add(k);
      }
    });

    return new ImList(result);
  }

  ImList<E> add<E2>(E2 value) => new ImList([]
    ..addAll(_data)
    ..add(value));

  ImList<E> remove<E2>(E2 value) => removeWhere((v) => v == value);

  ImList<E> shuffle() => new ImList([]
    ..addAll(_data)
    ..shuffle());

  E operator [](int index) {
    try {
      return _data[index];
    } catch (_) {
      return null;
    }
  }

  void operator []=(index, E value) {
    throw new Exception('Cannot modify');
  }

  ImList<E> operator +(value) {
    if (value is List) return new ImList([]..addAll(_data)..addAll(value));

    return new ImList([]
      ..addAll(_data)
      ..add(value));
  }

  ImList<E> operator -(value) {
    if (value is List) return removeWhere((v) => value.contains(v));

    return removeWhere((v) => v == value);
  }
}
