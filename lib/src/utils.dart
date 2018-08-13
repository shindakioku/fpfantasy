import './curry/curry.dart';

/* Function | Int */ add(int a, [int b]) => curry((a, b) => a + b)(a, b);

var always = <T>(T a) => a;

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
