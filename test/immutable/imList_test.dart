import 'package:fpfantasy/src/immutable/imList.dart';
import 'package:test/test.dart';

void main() {
  test('Create the object of ImList', () {
    var a = new ImList();
    var b = new ImList(3);
    var c = new ImList([1, 2, 3]);

    expect(a.data.length, 0);
    expect(b.data.length, 3);
    expect(b.data, [null, null, null]);
    expect(c.data.length, 3);
    expect(c.data, [1, 2, 3]);
  });

  test('Generate', () {
    var a = new ImList.generate(3, (int index) => index * index);

    expect(a.data.length, 3);
    expect(a.data, [0, 1, 4]);
  });

  test('Has', () {
    var a = new ImList([0, 1, 2, 3, 'a']);

    expect(a.has(0), true);
    expect(a.has('a'), true);
    expect(a.has('b'), false);
    expect(a.has(51), false);
  });

  test('Map', () {
    var a = new ImList([0, 1, 2, 'a', 'b', null]);
    var b = a.map((v) {
      if (v is String) return v;
    });

    expect(a.data.length, 6);
    expect(a.data, [0, 1, 2, 'a', 'b', null]);
    expect(b.data.length, 6);
    expect(b.data, [null, null, null, 'a', 'b', null]);
  });

  test('For each', () {
    var a = new ImList([0, 1, 2, 'a', 'b', null]);
    var b = [];

    a.forEach((v) => b.add(v));

    expect(b, a.data);
  });

  test('Take where', () {
    var a = new ImList([0, 1, 2, 'a', 'b', 'c']);
    var b = a.takeWhere((v) => 0 == v);

    expect(a.data, [0, 1, 2, 'a', 'b', 'c']);
    expect(b.data, [0]);

    expect((a.takeWhere((v) => 'a' == v || 'c' == v)).data, ['a', 'c']);
  });

  test('Remove where', () {
    var a = new ImList([0, 1, 2, 'a', 'b', 'c']);
    var b = a.removeWhere((v) => 'a' == v);
    var c = b.removeWhere((v) => 2 == v);

    expect(a.data, [0, 1, 2, 'a', 'b', 'c']);
    expect(b.data, [0, 1, 2, 'b', 'c']);
    expect(c.data, [0, 1, 'b', 'c']);
  });

  test('Get element with [] operator', () {
    var a = new ImList([1, 2, 'a']);

    expect(1, a[0]);
    expect(2, a[1]);
    expect('a', a[2]);
    expect(null, a[3]);
  });

  test('Add', () {
    var a = new ImList([1, 2]);
    var b = a.add(0);

    expect(a.data, [1, 2]);
    expect(b.data, [1, 2, 0]);
  });

  test('Remove', () {
    var a = new ImList([1, 2]);
    var b = a.remove(2);

    expect(a.data, [1, 2]);
    expect(b.data, [1]);
  });

  test('Shuffle', () {
    var a = new ImList([0, 1, 2]);
    a.shuffle();

    expect(a.data, [0, 1, 2]);
  });

  test('Add with +', () {
    var a = new ImList([1, 2]);
    var b = a + 0;
    var c = b + [3, 4];

    expect(a.data, [1, 2]);
    expect(b.data, [1, 2, 0]);
    expect(c.data, [1, 2, 0, 3, 4]);
  });

  test('Remove with -', () {
    var a = new ImList(['a', 'b', 1, 2]);
    var b = a - 1;
    var c = b - ['a', 'b'];

    expect(a.data, ['a', 'b', 1, 2]);
    expect(b.data, ['a', 'b', 2]);
    expect(c.data, [2]);
  });
}
