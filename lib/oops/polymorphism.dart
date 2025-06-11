// this file demonstrates polymorphism in Dart.

void main() {
  // Create instances of ClassA and ClassB
  BaseClass a = ClassA();
  BaseClass b = ClassB();

  // Call the method on each instance
  a.method();
  b.method();
}


abstract class BaseClass {
  void method();
}


class ClassA extends BaseClass {
  void method() {
    print("Method from ClassA");
  }
}


class ClassB  extends BaseClass {
  void method() {
    print("Method from ClassB");
  }
}