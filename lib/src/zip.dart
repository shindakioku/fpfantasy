List _zip(a, b) => [a, b];

List zipWith<T>(List f(T y, T x), List<T> a, List<T> b) {
  var result = [];

  if (a.length > b.length) {
    a.length = b.length;
  } else {
    b.length = a.length;
  }

  for (var i = 0; i < a.length; i++) {
    result.add(f(a[i], b[i]));
  }

  return result;
}

Map zipMap<T>(List<T> a, List<T> b) {
  var result = {};

  zipWith(_zip, a, b).forEach((v) {
    result.addAll({v[0]: v[1]});
  });

  return result;
}

List zip<T>(List<T> a, List<T> b) => zipWith(_zip, a, b);
