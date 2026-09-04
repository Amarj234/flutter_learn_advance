abstract class Workable {
  void work();
}

abstract class Eatable {
  void eat();
}

abstract class Drivable {
  void drive();
}

class OfficeWorker implements Workable, Eatable {
  @override
  void work() {}

  @override
  void eat() {}
}