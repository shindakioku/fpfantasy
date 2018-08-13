import './curry/curry.dart';

dynamic _call<T>(List<Function> functions, T data) {
  for (Function f in functions) {
    data = f(data);
  }

  return data;
}

Function compose(List<Function> functions) =>
    curry(<T>(T data) => _call<T>(functions, data), argsLength: 1);

Function composeK(List<Function> functions) =>
    curry(<T>(T data) => _call<T>(functions.reversed.toList(), data),
        argsLength: 1);
