/**
 * Provides union types.
 * 
 *      var IntString = types([int, String])
 *      var f = <T>(T a) {
 *        var b = IntString(a, (String argType) => 'Incorrect type ${argType}');
 *
 *        if (F.isNotNull(b)) return b;
 *
 *        return true;
 *      };
 *      f(1); // true
 *      f([]); // Incorrect type list
 * 
 */
dynamic types =
    <T>(List<T> args, [error(String a)]) => new _Types<T>(args, error).check;

String typeToString<T>(T type) =>
    type.toString().replaceAll(new RegExp('(<[^>]+>)'), '').toLowerCase();

dynamic checkTypes<T>(List types, T arg, [error(String a)]) {
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
