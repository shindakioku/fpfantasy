import 'package:fpfantasy/fpfantasy.dart';
import 'package:test/test.dart';

void main() {
  test('Chain list', () {
    var s = chainList([1, 2, 3]).c((v) => v + 1).c((v) => v * 2).result();
    var result = [((1 + 1) * 2), ((2 + 1) * 2), ((3 + 1) * 2)];

    expect(result, s);
  });

  test('Chain map with values only', () {
    var s =
        chainMap({0: 1, 1: 2, 2: 3}).c((v) => v + 1).c((v) => v * 2).result();

    var result = {0: ((1 + 1) * 2), 1: ((2 + 1) * 2), 2: ((3 + 1) * 2)};

    expect(result, s);
  });
}
