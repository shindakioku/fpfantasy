import './equals.dart';

var default_ = 'default';

/**
 * Same with switch/case or if/ifelse.
 * Can be call with [List], [Map] and with 'curring'.
 * 
 *      var _ = matching([
 *         [0, () => 2],
 *         [1, () => 3],
 *         [default_, 'default']
 *       ]);
 *      _(4); // 'default'
 * 
 *      var _ = 
 *          matching(0, () => () => 2)('a', [1, 2])([], {})(default_, 'default');
 *      _(0)(); 2
 * 
 */
Function matching<T>(T a, [b]) {
  if (isNull(b)) return matchWithoutCurry(a as List);

  var m = new Matching()..cond(a, b);

  // (0, () => 0)(1, () => 1)(1) - b is null
  return isNull(b) ? m.match : m.cond;
}

Function matchWithoutCurry(List a) {
  var m = new Matching();

  if (a is List) {
    if (a[0] is Map) a.forEach((v) => m.cond(v.keys.first, v.values.first));

    if (a[0] is List) a.forEach((v) => m.cond(v[0], v[1]));
  }

  return m.match;
}

class Matching {
  List _matches = [];

  /* Function | T */ cond<T>(T pattern, [f]) {
    if (isNull(f)) return match(pattern);

    _matches.add([pattern, f]);

    return cond;
  }

  T match<T>(T data) {
    var d = null;

    for (List m in _matches) {
      var pattern = m[0];
      var handler = m[1];

      if (pattern == data) return handler is Function ? handler() : handler;

      if (default_ == pattern) d = handler;
    }

    if (isNotNull(d)) return d is Function ? d() : d;

    return null;
  }
}
