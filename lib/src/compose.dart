import './curry/curry.dart';

E _call<T, E>(List<E Function(T _)> fns, T _) =>
    fns.fold(_, (acc, f) => f(acc)) as E;

/**
 * https://en.wikipedia.org/wiki/Function_composition
 * 
 *      var a = (x) => [0];
 *      var b = (x) => x[0] + 3;
 *      var data = [1, 2]
 * 
 *      print(compose([a, b])(data)); // 3
 * 
 */
Function compose<T, E>(List<E Function(T _)> functions) =>
    curry((T data) => _call<T, E>(functions, data), argsLength: 1);

Function composeK<E, T>(List<E Function(T _)> functions) =>
    curry((T data) => _call<T, E>(functions.reversed.toList(), data),
        argsLength: 1);
