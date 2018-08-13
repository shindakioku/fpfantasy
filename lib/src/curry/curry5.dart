import '../equals.dart';
import './curry.dart';

Function curry5 = (Function fn) => (a, [b, c, d, e]) {
      var call = (a, b, c, d, e) => fn(a, b, c, d, e);

      if (isNull(b)) {
        return curry(([b, c, d, e]) => call(a, b, c, d, e), argsLength: 4);
      }

      if (isNull(c)) {
        return curry(([c, d, e]) => call(a, b, c, d, e), argsLength: 3);
      }

      if (isNull(d)) return curry((d, e) => call(a, b, c, d, e));

      if (isNull(e)) return curry((e) => call(a, b, c, d, e), argsLength: 1);

      return call(a, b, c, d, e);
    };
