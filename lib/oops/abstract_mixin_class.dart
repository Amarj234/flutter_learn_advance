


class ClassWithAbstractMixin {
  void method() {
    print('Method in ClassWithAbstractMixin');
  }
}



abstract class AbstractMixin {// This is an abstract class that can be used as a mixin
  // It can contain abstract methods or concrete methods
  void mixinMethod() {
    print('Mixin method in AbstractMixin');
  }
}



mixin MyMixin on ClassWithAbstractMixin {  // if you want to use mixin with abstract class, you need to use on keyword
  // This mixin can only be used with ClassWithAbstractMixin or its subclasses
  void mixinMethod() {
    print('Mixin method in MyMixin');
  }
}

mixin MyOtherMixin on ClassWithAbstractMixin {
  void mixinMethod() {
    print('Mixin method in MyOtherMixin');
  }
}



mixin MyOtherMixin2 on ClassWithAbstractMixin, AbstractMixin , MyMixin { // This mixin can be used with ClassWithAbstractMixin, AbstractMixin, or MyMixin
  // This mixin can be used with ClassWithAbstractMixin, AbstractMixin, or My
  void mixinMethod() {
    print('Mixin method in MyOtherMixin');
  }
}


class MyClass extends ClassWithAbstractMixin with MyMixin , MyOtherMixin {// This class extends ClassWithAbstractMixin and uses MyMixin
  // It can also use MyOtherMixin if needed
  @override
  void method() {
    super.method();
    mixinMethod();
  }
}

class MyOtherClass implements ClassWithAbstractMixin, MyMixin {// This class implements ClassWithAbstractMixin and MyMixin
  // It must provide implementations for all methods in the abstract class and mixin

  @override
  void method() {
    print('Method in MyOtherClass');
  }

  @override
  void mixinMethod() {
    print('Mixin method in MyOtherClass');
  }
}


void main() {
  final myClass = MyClass();
  myClass.method(); // Calls method from ClassWithAbstractMixin and mixinMethod from MyMixin
}

