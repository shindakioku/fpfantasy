import 'package:fpfantasy/fpfantasy.dart' as F;
import 'package:test/test.dart';

class Foo {}

class Bar {}

class Bar1 {}

void main() {
  test('Dart types', () {
    var IntString = F.types([int, String]);

    var f = <T>(T a) {
      var b = IntString(a, (String argType) => 'Incorrect type ${argType}');

      if (F.isNotNull(b)) return b;

      return true;
    };

    expect(f(1), true);
    expect(f('qwe'), true);
    expect(f([]), 'Incorrect type list');
    expect(f(true), 'Incorrect type bool');
    expect(f({}), 'Incorrect type map');
  });

  test('Classes in project', () {
    var FooBar = F.types([Foo, Bar]);

    var f = <T>(T a) {
      var b = FooBar(a, (String argType) => 'Incorrect type ${argType}');

      if (F.isNotNull(b)) return b;

      return true;
    };

    expect(f(new Foo()), true);
    expect(f(new Bar()), true);
    expect(f(new Bar1()), 'Incorrect type bar1');
    expect(f(1), 'Incorrect type int');
    expect(f('qwe'), 'Incorrect type string');
    expect(f([]), 'Incorrect type list');
    expect(f(true), 'Incorrect type bool');
    expect(f({}), 'Incorrect type map');
  });

  test('Classes from project and Dart types', () {
    var FooBar = F.types([Foo, Bar1, int, double, List]);

    var f = <T>(T a) {
      var b = FooBar(a, (String argType) => 'Incorrect type ${argType}');

      if (F.isNotNull(b)) return b;

      return true;
    };

    expect(f(new Foo()), true);
    expect(f(new Bar1()), true);
    expect(f(1), true);
    expect(f(2.33), true);
    expect(f([]), true);
    expect(f('qwe'), 'Incorrect type string');
    expect(f(new Bar()), 'Incorrect type bar');
    expect(f(true), 'Incorrect type bool');
    expect(f({}), 'Incorrect type map');
  });

  test('With global (for types) handler of error', () {
    var IntString =
        F.types([int, String], (String argType) => 'Incorrect type ${argType}');

    var f = <T>(T a) {
      var b = IntString(a);

      if (F.isNotNull(b)) return b;

      return true;
    };

    expect(f(1), true);
    expect(f('qwe'), true);
    expect(f([]), 'Incorrect type list');
    expect(f(true), 'Incorrect type bool');
    expect(f({}), 'Incorrect type map');
  });
}
