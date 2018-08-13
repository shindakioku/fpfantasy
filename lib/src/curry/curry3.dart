import '../equals.dart';
import './curry.dart';

Function curry3 = (Function fn) => (a, [b, c]) {
      var call = (a, b, c) => fn(a, b, c);

      if (isNull(b)) return curry((b, c) => call(a, b, c));

      if (isNull(c)) return curry((c) => call(a, b, c), argsLength: 1);

      return fn(a, b, c);
    };
