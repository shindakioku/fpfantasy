import 'package:fpfantasy/fpfantasy.dart';
import 'package:test/test.dart';

void main() {
  test('Concat with integers', () {
    expect(concat(1, 2), 12);
    expect(concat(31, 1), 311);
  });

  test('Concat with strings', () {
    expect(concat('AB', 'cd'), 'ABcd');
    expect(concat('A', 'bcd'), 'Abcd');
  });

  test('Concat with lists without nesting', () {
    expect(concat([1, 2], [3, 4]), [1, 2, 3, 4]);
  });

  test('Concat with lists with nesting', () {
    var a = [
      1,
      2,
      [3, 4],
      [5]
    ];
    var b = [6];

    expect(concat(a, b), [1, 2, 3, 4, 5, 6]);

    expect(
        concat(a, [
          6,
          [
            6,
            [7]
          ]
        ]),
        [1, 2, 3, 4, 5, 6, 6, 7]);

    expect(
        concat(a, [
          {0: 1}
        ]),
        [
          1,
          2,
          3,
          4,
          5,
          {0: 1}
        ]);
  });

  test('Concat with maps without nesting', () {
    expect(concat({0: 1}, {1: 1}), {0: 1, 1: 1});
  });

  test('Concat with maps with nesting', () {
    var a = {
      0: {
        'a': 'b',
        'c': {'d': 'y'}
      }
    };
    var b = {3: 'a'};

    expect(concat(a, b), {'a': 'b', 'd': 'y', 3: 'a'});
  });
}
