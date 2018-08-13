import 'package:fpfantasy/src/equals.dart' as F;
import 'package:test/test.dart';

void main() {
  test('eqBy', () {
    var a = F.eqBy((a) => a + 1, 1, 1);
    var b = F.eqBy((_) => 's', 'qq', 2);
    var c = F.eqBy((a) => a * 2, 1, 3);

    expect(a, true);
    expect(b, true);
    expect(c, false);
  });

  test('equals', () {
    expect(F.equals(1, 2), false);
    expect(F.equals(1, 1), true);

    expect(F.equals(1.11, 2.22), false);
    expect(F.equals(1.11, 1.11), true);

    expect(F.equals('a', 'b'), false);
    expect(F.equals('a', 'a'), true);

    expect(F.equals([1, 2, 3], [1, 2, 4]), false);
    expect(F.equals([1, 2, 3], [1, 2, 3]), true);

    expect(
        F.equals([
          1,
          2,
          [
            4,
            [5],
            [6]
          ]
        ], [
          1,
          2,
          [
            4,
            [5],
            [6]
          ]
        ]),
        true);

    expect(
        F.equals([
          1,
          2,
          [3, 1]
        ], [
          1,
          2,
          [3, 1]
        ]),
        true);

    expect(
        F.equals([
          1,
          2,
          [
            4,
            [5],
            [6],
            [8]
          ]
        ], [
          1,
          2,
          [
            4,
            [5],
            [6],
            [7]
          ]
        ]),
        false);
  });
}
