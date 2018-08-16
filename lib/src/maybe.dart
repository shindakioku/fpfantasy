import './equals.dart';

_map<T>(T value, f /* E f(T) | E f(K, V) */) {
  if (isNull(value)) return null;

  var result = null;

  if (value is List) {
    result = [];

    for (var v in value) {
      result.add(f(v));
    }
  } else if (value is Map) {
    result = {};

    value.map((k, v) => result.addAll(f(k, v)));
  } else {
    result = f(value);
  }

  return result;
}

_filter(f /* bool f(a, [b]) */, value) {
  var result = null;

  if (value is List) {
    result = [];

    for (var v in value) {
      if (f(v)) result.add(v);
    }
  } else if (value is Map) {
    result = {};

    value.forEach((k, v) => result.addAll(f(k, v)));
  } else {
    result = value;
  }

  return result;
}

class Nothing {
  bool get isSome => false;

  @override
  String toString() => 'Nothing';

  fold<E>(E defaultValue) => (f(T)) => defaultValue;

  Just<T> orJust<T>(T a) => Just(a);

  Just<T> getOrElse<T>(T a) => orJust(a);
}

class Just<T> {
  T _value;

  T get just => _value;

  bool get isNothing => _value is Nothing || isNull(_value);

  Just(this._value);

  Just<E> map<E>(f) => new Just(_map(_value, f));

  fold<E>(E defaultValue) => (f(T)) => isNothing ? defaultValue : f(_value);

  /* T | E */ orJust<E>(E a) => isNothing ? a : _value;

  /* T | E */ getOrElse<E>(E a) => orJust(a);

  Just filter(f) => isNothing ? this : new Just(_filter(f, _value));

  @override
  bool operator ==(Object a) => a is Just ? _value == a.just : _value == a;

  @override
  int get hashCode => super.hashCode;
}

class Maybe<T> {
  T _value;

  T get value => _value;

  bool get isJust => _value is Just;

  bool get isNothing => _value is Nothing || isNull(_value);

  Just get just => new Just(_value);

  Maybe(this._value);

  Maybe<E> map<E>(f) => new Maybe(_map(value, f));

  cata(f, fn(T)) => isJust ? fn(_value) : f();

  fold<E>(E defaultValue) => (f(T)) => isNothing ? defaultValue : f(_value);

  Just orJust<E>(E a) => isNothing || isNull(_value) ? new Just(a) : just;

  Just getOrElse<E>(E a) => orJust<E>(a);

  /* T | Null */ orNull() => isNull(_value) ? null : _value;

  Maybe orElse<E>(E a) => isNothing ? new Maybe(a) : this;

  Maybe filter(f) => new Maybe(_filter(f, _value));

  @override
  bool operator ==(Object a) {
    if (a is Maybe) return _value == a.value;

    if (a is Just) return a == just;

    return a == _value;
  }

  @override
  int get hashCode => super.hashCode;
}
