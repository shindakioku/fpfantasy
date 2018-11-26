import 'package:fpfantasy/fpfantasy.dart';
import 'package:test/test.dart';

void main() {
  test('Ap', () {
    int Function(int) a = (int x) => x + 1;
    int Function(int) b = (int x) => x * 2;
    var data = [1, 2];

    var result = ap([a, b], data);

    expect(result, [((1 + 1) * 2), ((2 + 1) * 2)]);
  });
}
