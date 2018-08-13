import '../equals.dart';
import './curry.dart';

Function curry4 = (Function fn) => (a, [b, c, d]) {
      var call = (a, b, c, d) => fn(a, b, c, d);

      if (isNull(b)) {
        return curry(([b, c, d]) => call(a, b, c, d), argsLength: 3);
      }

      if (isNull(c)) return curry(([c, d]) => call(a, b, c, d));

      if (isNull(d)) return curry((d) => call(a, b, c, d), argsLength: 1);

      return fn(a, b, c, d);
    };
