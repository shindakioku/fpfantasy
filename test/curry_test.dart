import 'package:fpfantasy/fpfantasy.dart';
import 'package:test/test.dart';

void main() {
  test('Curry1', () {
    var curriedFunction = curry((a) => a, argsLength: 1);

    expect(2, curriedFunction(2));
  });

  test('Curry2', () {
    var curriedFunction = curry((a, b) => a + b);

    expect(3, curriedFunction(1, 2));
    expect(3, curriedFunction(1)(2));

    var t = curriedFunction(1);

    expect(3, t(2));
  });

  test('Curry3', () {
    var curriedFunction = curry((a, b, c) => a + b + c, argsLength: 3);

    expect(4, curriedFunction(1, 2, 1));
    expect(5, curriedFunction(1)(2)(2));
    expect(6, curriedFunction(1, 2)(3));
    expect(7, curriedFunction(1)(3, 3));

    var t = curriedFunction(1);
    var c = t(3);

    expect(8, c(4));
  });

  test('Curry4', () {
    var curriedFunction = curry((a, b, c, d) => a + b + c + d, argsLength: 4);

    expect(4, curriedFunction(1, 2, 1, 0));
    expect(5, curriedFunction(1)(1)(2)(1));
    expect(6, curriedFunction(1, 2)(1)(2));
    expect(7, curriedFunction(1, 2)(1, 3));
    expect(8, curriedFunction(1, 2, 1)(4));
    expect(9, curriedFunction(1)(1, 1)(6));
    expect(10, curriedFunction(5)(5)(0, 0));

    var a = curriedFunction(1);
    var b = a(2);
    var c = b(3);

    expect(10, c(4));
  });

  test('Curring with 5 arguments', () {
    var curriedFunction =
        curry((a, b, c, d, e) => a + b + c + d + e, argsLength: 5);

    expect(5, curriedFunction(1, 1, 1, 1, 1));
    expect(6, curriedFunction(1, 1, 1, 1)(2));
    expect(7, curriedFunction(1, 1, 1)(2)(2));
    expect(8, curriedFunction(1, 1)(2)(2)(2));
    expect(9, curriedFunction(0)(3)(2)(2)(2));
    expect(10, curriedFunction(5)(1, 2)(1)(1));
    expect(11, curriedFunction(5)(1, 2, 2)(1));
    expect(12, curriedFunction(5)(1)(1, 2, 3));
    expect(13, curriedFunction(5)(1)(1)(3, 3));

    var a = curriedFunction(1);
    var b = a(2);
    var c = b(3);
    var d = c(3);

    expect(14, d(5));
  });
}
