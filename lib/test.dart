import 'package:equatable/equatable.dart';
import 'package:learn_more/api/user_model.dart';



class MyClass extends Equatable{
final String name;
final String description;
final int id;
final List<MyApp>? myModels;

  // Constructor with default values and required parameters
  // If name is not provided, it defaults to 'Default Name'
  // If id is not provided, it defaults to 0
  // description is required
const MyClass({this.name = 'Default Name', required this.description, this.id = 0,this.myModels});  


getData(){
  return 'Data from MyClass';
}

@override
List<Object> get props=>[name, description, id, myModels ?? []];
}


void main() {
  MyClass myClass = MyClass(name: 'My Class', description: 'This is my class', id: 2, myModels: [MyApp(count: 1, message: 'Hello', status: true, user: [User(id: 1, name: 'John', age: 30)])]);
    MyClass myClass2 = MyClass(name: 'My Class', description: 'This is my class', id: 2, myModels: [MyApp(count: 1, message: 'Hello', status: true, user: [User(id: 1, name: 'John 1', age: 30)])]);
  print(myClass.getData()); // Output: Data from MyClass

  print(myClass.name); // Output: My Class
  print(myClass.props[0]); // Output: My Class
  print(myClass.props[1]); // Output: This is my class
  print(myClass.props[2]); // Output: 2

  print(myClass == myClass2); // Output: true, because Equatable checks for value equality
  print(myClass.props.toString() == myClass2.props.toString()); // Output: true, because props are

}