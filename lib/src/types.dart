var types =
    <T>(List<T> args, [error(String a)]) => new _Types<T>(args, error).check;

String typeToString<T>(T type) =>
    type.toString().replaceAll(new RegExp('(<[^>]+>)'), '').toLowerCase();

/* void | Function (Error) */ checkTypes<T>(List types, T arg,
    [error(String a)]) {
  var argType =
      arg is Map ? 'map' : arg is List ? 'list' : typeToString(arg.runtimeType);
  var isCorrect = false;

  for (var type in types) {
    if (typeToString(type) == argType) {
      isCorrect = true;

      break;
    }
  }

  if (!isCorrect) return error(argType);
}

class _Types<T> {
  List<T> _types = [];
  Function _error = null;

  _Types(this._types, [this._error]);

  check(arg, [error(String a)]) {
    return checkTypes(_types, arg, error ?? _error);
  }
}
