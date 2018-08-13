import 'package:fpfantasy/fpfantasy.dart';
import 'package:test/test.dart';

void main() {
  test('With integers and lists', () {
    var a = matching([
      [0, () => 2],
      [1, () => 3],
      [default_, 'default']
    ]);

    expect(a(4), 'default');

    var b = matching([
      [0, () => 2],
      [1, 1]
    ]);

    expect(b(1), 1);

    var c = matching([
      [0, () => 0]
    ]);

    expect(c(0), 0);
  });

  test('With strings and maps', () {
    var a = matching([
      {0: () => 2},
      {1: () => 3},
      {default_: 'default'}
    ]);

    expect(a(4), 'default');

    var b = matching([
      {'a': () => 'a'},
      {'b': 'b'}
    ]);

    expect(b('a'), 'a');

    var c = matching([
      {'abv': () => 'a'}
    ]);

    expect(c('abv'), 'a');
  });

  test('All with curring', () {
    var a =
        matching(0, () => () => 2)('a', [1, 2])([], {})(default_, 'default');

    expect(a(0)(), 2);
    expect(a('a'), [1, 2]);
    expect(a([]), default_);
    expect(a(41321), default_);
  });
}
