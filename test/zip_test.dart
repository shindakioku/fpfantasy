import 'package:fpfantasy/fpfantasy.dart';
import 'package:test/test.dart';

void main() {
  test('Zip', () {
    var a = [1, 2, 3];
    var b = ['a', 'b', 'c'];
    var c = ['a', 'b', 'c', 'd', 'e'];
    var d = [1, 2, 3, 4];

    expect(zip(a, b), [
      [1, 'a'],
      [2, 'b'],
      [3, 'c']
    ]);
    expect(zip(a, c), [
      [1, 'a'],
      [2, 'b'],
      [3, 'c']
    ]);
    expect(zip(d, c), [
      [1, 'a'],
      [2, 'b'],
      [3, 'c']
    ]);
  });

  test('Zip map', () {
    var a = ['a', 'b', 'c'];
    var b = [1, 2, 3];
    var d = ['a', 'b', 'c', 'd', 'e'];
    var c = [1, 2, 3, 4];

    expect(zipMap(a, b), {'a': 1, 'b': 2, 'c': 3});
    expect(zipMap(a, b), {'a': 1, 'b': 2, 'c': 3});
    expect(zipMap(a, c), {'a': 1, 'b': 2, 'c': 3});
    expect(zipMap(d, c), {'a': 1, 'b': 2, 'c': 3});
  });
}
