List ap<T>(List<Function> functions, List<T> data) =>
    functions.fold(data, (list, f) => list.map((v) => f(v)).toList());
