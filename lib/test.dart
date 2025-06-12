

class Myclass<S>{
  S value;

  Myclass({required this.value});
  void printValue() {
    print('Value: $value');
  }
}



void main() {
  var myIntClass = Myclass<int>(value: 10);
  myIntClass.printValue(); // Output: Value: 10

  var myStringClass = Myclass<String>(value: 'Hello');
  myStringClass.printValue(); // Output: Value: Hello



}