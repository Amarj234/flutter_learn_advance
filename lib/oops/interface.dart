
// This is an interface
abstract class MyInterface {
  void greet();
  String getName();
}


class Person implements MyInterface {
  final String name;

  Person(this.name);

  @override
  void greet() {
    print("Hello, my name is $name");
  }

  @override
  String getName() {
    return name;
  }
}


abstract class A {
  void methodA();
}

abstract class B {
  void methodB();
}

abstract class E {
  void methodE(){
    print("myVal");
  }
}

class C implements A, B {
  @override
  void methodA() => print("A");

  @override
  void methodB() => print("B");
}

class D extends A{
  @override
  void methodA() {
    // TODO: implement methodA
  }

}

class F extends E{

  // no need to implements any method here if we use extends
}