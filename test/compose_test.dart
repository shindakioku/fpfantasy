import 'package:fpfantasy/fpfantasy.dart';
import 'package:test/test.dart';

void main() {
  test('Compose left to right', () {
    var a = (x) => [0];
    var b = (x) => x[0] + 3;
    var data = [1, 2];

    var result = compose([a, b])(data);

    expect(result, 3);
  });

  test('Compose right to left', () {
    var classyGreeting = (name) => 'the name ${name}, ${name} ${name}';
    var yellGreeting = composeK([capitalize, classyGreeting]);

    expect('The name Bond, Bond Bond', yellGreeting('Bond'));
  });
}
