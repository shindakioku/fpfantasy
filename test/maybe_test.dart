import 'package:fpfantasy/fpfantasy.dart';
import 'package:test/test.dart';

void main() {
  nothing();

  just();

  maybe();
}

nothing() {
  test('Nothing all', () {
    var a = new Nothing();

    expect(a.toString(), 'Nothing');

    expect(a.fold(-1)((v) => v + 1), -1);

    expect(a.getOrElse(123) == new Just(123), true);
  });
}

just() {
  test('Create object and get the value', () {
    var a = new Just(123);

    expect(a.just, 123);
    expect(a.isNothing, false);

    expect(new Just(new Nothing()).isNothing, true);
    expect(new Just(null).isNothing, true);
  });

  test('Map just', () {
    var c = new Just([5, 4, 1, 4, 3]);
    var d = new Just([1, 2, 3]);

    expect(c.map((v) => v + 1).just, [6, 5, 2, 5, 4]);
    expect(d.map((v) => v * 2).just, [2, 4, 6]);
  });

  test('Fold just', () {
    var a = new Just(123);
    var b = new Just(null);
    var c = new Just([]);
    var d = new Just(new Nothing());

    expect(a.fold(1)((v) => v + 1), 124);
    expect(b.fold('ha')((v) => v + 1), 'ha');
    expect(d.fold(1)((v) => v), 1);
    expect(
        c.fold(123)((v) {
          v.add(1);

          return v;
        }),
        [1]);
  });

  test('getOrElse', () {
    var a = new Just(123);
    var b = new Just(null);
    var c = new Just([]);
    var d = new Just(new Nothing());

    expect(a.getOrElse('abc'), 123);
    expect(b.getOrElse('k'), 'k');
    expect(c.getOrElse(null), []);
    expect(new Just(d.getOrElse('A')), new Just('A'));
  });

  test('filter just', () {
    var a = new Just(123);
    var b = new Just(null);
    var c = new Just([5, 4, 1, 4, 3]);
    var d = new Just(new Nothing());

    expect(a.filter((v) => v > 1), a);
    expect(b.filter((v) => v + 3), b);
    expect(d.filter((v) => v), d);

    expect(c.filter((v) => 2 < v).just, [5, 4, 4, 3]);
  });

  test('Equals just', () {
    var a = new Just(123);
    var b = new Just(null);
    var c = new Just([5, 4, 1, 4, 3]);
    var d = new Just(new Nothing());

    expect(123 == a, false);
    expect(a == 123, true);
    expect(a == '123', false);
    expect(b == new Just(null), true);
    expect(c == [], false);
    expect(d.isNothing, true);
  });
}

maybe() {
  test('Create Maybe and call getters', () {
    var a = new Maybe(2);
    var b = new Maybe(null);
    var c = new Maybe<String>('qweqwe');

    expect(a.value, 2);
    expect(b.value, null);
    expect(c.value, 'qweqwe');

    expect(a.isJust, false);
    expect(b.isJust, false);
    expect(c.isJust, false);

    expect(a.isNothing, false);
    expect(b.isNothing, true);
    expect(c.isNothing, false);

    expect(a.just == new Just(2), true);
  });

  test('Map maybe', () {
    var c = new Maybe([5, 4, 1, 4, 3]);
    var d = new Maybe(new Just([1, 2, 3]));

    expect(c.map((v) => v + 1).value, [6, 5, 2, 5, 4]);
    expect(new Maybe(d.value.just).map((v) => v * 2).value, [2, 4, 6]);
  });

  test('Fold maybe', () {
    var a = new Maybe(123);
    var b = new Maybe(null);
    var c = new Maybe([]);
    var d = new Maybe(new Nothing());

    expect(a.fold(1)((v) => v + 1), 124);
    expect(b.fold('ha')((v) => v + 1), 'ha');
    expect(d.fold(1)((v) => v), 1);
    expect(
        c.fold(123)((v) {
          v.add(1);

          return v;
        }),
        [1]);
  });

  test('Cata maybe', () {
    var a = new Maybe([5, 4, 1, 4, 3]);
    var b = new Maybe(Just(null));
    var c = new Maybe(Just(123));
    var d = new Maybe(new Nothing());

    expect(a.cata(() => false, (v) => v), false);
    expect(b.cata(() => false, (v) => v) == new Just(null), true);
    expect(c.cata(() => false, (v) => v).just, 123);
    expect(d.cata(() => 'q', (v) => v), 'q');
  });

  test('getOrElse maybe', () {
    var a = new Maybe(123);
    var b = new Maybe(null);
    var c = new Maybe([]);
    var d = new Maybe(new Nothing());

    expect(a.getOrElse('abc') == new Just(123), true);
    expect(b.getOrElse('k') == new Just('k'), true);
    expect(c.getOrElse(null).just, []);
    expect(d.getOrElse('A') == new Just('A'), true);
  });

  test('orNull maybe', () {
    var a = new Maybe(null);
    var b = new Maybe(123);

    expect(a.orNull(), null);
    expect(b.orNull(), 123);
  });

  test('orElse maybe', () {
    var a = new Maybe(123);
    var b = new Maybe(null);
    var c = new Maybe([]);
    var d = new Maybe(new Nothing());

    expect(a.orElse(1), a);
    expect(b.orElse('q').just == new Just('q'), true);
    expect(c.orElse(null), c);
    expect(d.orElse(new Just(1)).value == new Just(1), true);
  });
}
