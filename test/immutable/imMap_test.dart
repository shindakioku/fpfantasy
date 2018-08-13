import 'package:fpfantasy/src/immutable/imMap.dart';
import 'package:test/test.dart';

void main() {
  test('fromList with standart handler', () {
    var a = new ImMap.fromList([1, 2]);

    expect(a.data, {0: 1, 1: 2});
  });

  test('fromList with custom handler', () {
    var a = new ImMap.fromList([1, 2], (l) {
      var r = {};

      l.forEach((k) => r.addAll({(k + 2): k}));

      return r;
    });

    expect(a.data, {3: 1, 4: 2});
  });

  test('Contains key and value', () {
    var a = new ImMap({0: 3, 1: 4});

    expect(true, a.containsKey(0));
    expect(true, a.containsKey(1));

    expect(true, a.containsValue(3));
    expect(true, a.containsValue(4));

    expect(false, a.containsKey(3));
    expect(false, a.containsValue(0));
  });

  test('Map', () {
    var a = new ImMap({0: 'a', 1: 'b', 2: 'c'});
    var b = a.map((k, v) => {k + 1: v});

    expect(b.data, {1: 'a', 2: 'b', 3: 'c'});
  });

  test('Take where', () {
    var a = new ImMap({0: 'a', 1: 'b', 2: 'c'});
    var b = a.takeWhere((k, _) => 0 == k);

    expect(a.data, {0: 'a', 1: 'b', 2: 'c'});
    expect(b.data, {0: 'a'});

    expect(
        (a.takeWhere((_, v) => 'a' == v || 'c' == v)).data, {0: 'a', 2: 'c'});
  });

  test('Remove where', () {
    var a = new ImMap({0: 'a', 1: 'b', 2: 'c'});
    var b = a.removeWhere((_, v) => 'a' == v);
    var c = a.removeWhere((k, _) => 2 == k);

    expect(a.data, {0: 'a', 1: 'b', 2: 'c'});

    expect(b.data, {1: 'b', 2: 'c'});
    expect(c.data, {0: 'a', 1: 'b'});
  });

  test('Add', () {
    var a = new ImMap({0: 0});
    var b = a.add('a');
    var c = b.add('a', 'b');

    expect(a.data, {0: 0});
    expect(b.data, {0: 0, 1: 'a'});
    expect(c.data, {0: 0, 1: 'a', 'b': 'a'});
  });

  test('Operator []', () {
    var a = new ImMap({0: 'a', 1: 'b', 'b': 'c'});

    expect('a', a[0]);
    expect('c', a['b']);
  });

  test('Operator + with map', () {
    var a = new ImMap({0: 0});
    var b = a + {1: 1};
    var c = b + {'b': 'c'};

    expect(a.data, {0: 0});
    expect(b.data, {0: 0, 1: 1});
    expect(c.data, {0: 0, 1: 1, 'b': 'c'});
  });

  test('Operator + with any value except Map type', () {
    var a = new ImMap({0: 0});
    var b = a + 1;
    var c = b + 0;

    expect(a.data, {0: 0});
    expect(b.data, {0: 0, 1: 1});
    expect(c.data, {0: 0, 1: 1, 2: 0});
  });

  test('Operator - with map', () {
    var a = new ImMap({0: 0, 'a': 1, 'c': 'b'});
    var b = a - {0: 0};
    var c = b - {'a': 1};

    expect(a.data, {0: 0, 'a': 1, 'c': 'b'});
    expect(b.data, {'a': 1, 'c': 'b'});
    expect(c.data, {'c': 'b'});
  });

  test('Operator - with any value except Map type', () {
    var a = new ImMap({0: 0, 'a': 1, 'c': 'b'});
    var b = a - 0;
    var c = b - 'c';

    expect(a.data, {0: 0, 'a': 1, 'c': 'b'});
    expect(b.data, {'a': 1, 'c': 'b'});
    expect(c.data, {'a': 1});
  });
}
