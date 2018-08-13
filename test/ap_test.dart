import 'package:fpfantasy/fpfantasy.dart';
import 'package:test/test.dart';

void main() {
  test('Ap', () {
    var a = (x) => x + 1;
    var b = (x) => x * 2;
    var data = [1, 2];

    var result = ap([a, b], data);

    expect(result, [((1 + 1) * 2), ((2 + 1) * 2)]);
  });
}
