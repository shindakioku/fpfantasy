import './curry1.dart';
import './curry2.dart';
import './curry3.dart';
import './curry4.dart';
import './curry5.dart';

Function curry(Function fn, {int argsLength: 2}) {
  assert(argsLength <= 5);

  return <T, E, A, B, C>([T a, E b, A c, B d, C e]) {
    var args = [a, b, c, d, e].where((a) => a != null);

    // If args is equal to length of function arguments
    if (argsLength == args.length) return Function.apply(fn, List.of(args));

    if (1 == argsLength) return curry1(fn)(a);

    /**
    *     var a = curry((a, b) => print(a + b));
          var b = a(1);
          b(2); // 3
    */
    if (2 == argsLength) return curry2(fn)(a, b);

    /**
    *     var a = curry((a, b, c) => print(a + b + c));
          var b = a(1);
          var c = b(2);
          c(3); // 6
    */
    if (3 == argsLength) return curry3(fn)(a, b, c);

    /**
    *     var a = curry((a, b, c, d) => print(a + b + c + d));
          var b = a(1);
          var c = b(2);
          var d = c(3);
          d(4); // 10
    */
    if (4 == argsLength) return curry4(fn)(a, b, c, d);

    /**
    *     var a = curry((a, b, c, d, e) => print(a + b + c + d + e));
          var b = a(1);
          var c = b(2);
          var d = c(3);
          var e = c(4);
          e(5); // 15
    */
    if (5 == argsLength) return curry5(fn)(a, b, c, d, e);
  };
}
