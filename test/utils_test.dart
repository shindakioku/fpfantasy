import 'package:fpfantasy/fpfantasy.dart';
import 'package:test/test.dart';

void main() {
  test('Add', () {
    expect(1, add(1, 0));
    expect(2, add(1)(1));
  });
}
