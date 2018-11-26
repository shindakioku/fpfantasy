import './curry/curry.dart';

E _call<T, E>(List<E Function(T _)> fns, T _) =>
    fns.fold(_, (acc, f) => f(acc)) as E;

Function compose<T, E>(List<E Function(T _)> functions) =>
    curry((T data) => _call<T, E>(functions, data), argsLength: 1);

Function composeK<E, T>(List<E Function(T _)> functions) =>
    curry((T data) => _call<T, E>(functions.reversed.toList(), data),
        argsLength: 1);
