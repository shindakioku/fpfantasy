/**
 * Calls each functions for each value in the list.
 * 
 *      int Function(int) a = (int x) => x + 1;
 *      int Function(int) b = (int x) => x * 2;
 *      print(ap([a, b], [1, 2])); // 4, 6
 * 
 */
List ap<T>(List<Function> functions, List<T> data) =>
    functions.fold(data, (list, f) => list.map((v) => f(v)).toList());
