import 'dart:math';

int lanceDes(String name) {
  final r1 = Random();

  var result = r1.nextInt(6) + 1 + r1.nextInt(6) + 1;

  print('$name a lancé les dés et a obtenu la valeur $result');
  return result;
}
