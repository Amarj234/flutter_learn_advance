



extension StringExtensions on String {
  bool get isEmail => contains('@') && contains('.');
}



class Person {
  final String name;
  final int age;

  Person(this.name, this.age);
}

extension PersonExtension on Person {
  bool get isAdult => age >= 18;
}






void main() {
  print('hello@gmail.com'.isEmail); // true
  print('invalid_email'.isEmail); // false

  var p = Person('Amar', 20);
  print(p.isAdult); // true
}
