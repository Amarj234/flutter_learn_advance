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
  bool get another {
    String anotherValue = "Amar";
    return this == anotherValue;
  }
}

extension GetPength on Object {
  int get pength {
    int count = 0;

    if (this is String) {
      for (var _ in (this as String).runes) {
        count++;
      }
    } else if (this is List) {
      for (var _ in (this as List)) {
        count++;
      }
    } else {
      throw UnsupportedError(
          "pength is only supported for String and List types.");
    }

    return count;
  }
}

void main() {
  print('hello@gmail.com'.isEmail); // true
  print('invalid_email'.isEmail); // false

  var p = Person('Amar', 20);
  print(p.isAdult); // true

  String name = "Amarjeet";
  List items = [1, 2, 3, 4];

  print(name.pength); // Output: 8
  print(items.pength);
}
