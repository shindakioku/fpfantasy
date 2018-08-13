import '../equals.dart';

Function curry2 =
    (Function fn) => (a, [b]) => isNull(b) ? (b) => fn(a, b) : fn(a, b);
