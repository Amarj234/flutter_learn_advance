


class ClassWithAbstractMixin {
  void method() {
    print('Method in ClassWithAbstractMixin');
  }
}



class AbstractMixin {
  void mixinMethod() {
    print('Mixin method in AbstractMixin');
  }
}




mixin MyMixin on ClassWithAbstractMixin {
  void mixinMethod() {
    print('Mixin method in MyMixin');
  }
}

mixin MyOtherMixin on ClassWithAbstractMixin {
  void mixinMethod() {
    print('Mixin method in MyOtherMixin');
  }
}


class MyClass extends ClassWithAbstractMixin with MyMixin , MyOtherMixin {
  @override
  void method() {
    super.method();
    mixinMethod();
  }
}

class MyOtherClass implements ClassWithAbstractMixin, MyMixin {

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

