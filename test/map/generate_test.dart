import 'package:fpfantasy/src/map/generate.dart';
import 'package:test/test.dart';

void main() {
  test('Should be 2 elements', () {
    expect(generate(2), {0: 0, 1: 1});
  });

  test('Should be 4 elements', () {
    expect(generate(4), {0: 0, 1: 1, 2: 2, 3: 3});
  });

  test('fromValues', () {
    expect(fromValues([2, 3]), {2: 2, 3: 3});
    expect(fromValues(['a', 2]), {'a': 'a', 2: 2});
  });

  test('withValues', () {
    expect(withValues(['a', 'b']), {0: 'a', 1: 'b'});
    expect(withValues([1, 2, 'a']), {0: 1, 1: 2, 2: 'a'});
  });

  test('withCallback', () {
    var r = withCallback([1, 2, 'a'], (i, _) => {i: 0});

    expect(r, {0: 0, 1: 0, 2: 0});
  });
}
