List ap<T>(List<Function> functions, List<T> data) {
  functions.forEach((f) {
    var a = <T>[];

    data.forEach((v) => a.add(f(v)));

    data = a;
  });

  return data;
}
