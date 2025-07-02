
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final int age;

  User(this.name, this.age);

  @override
  List<Object?> get props => [name, age];
}

void main() {
  var u1 = User("Alice", 30);
  var u2 = User("Alice", 30);

  print(u1 == u2); // true ✅ because Equatable compares the fields
}
