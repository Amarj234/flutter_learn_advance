abstract class Worker {
  void work();
}

abstract class Eatable{
  void eat();
}

class HumanWorker implements Eatable,Worker{
  @override
  void eat() {
    print("Human eat");
  }

  @override
  void work() {
    print("Human work");
  }
}

class RoboticWorker implements Worker{

  @override
  void work() {
    // TODO: implement work
    print("Robot work");
  }
}

main(){
  Worker worker = HumanWorker();
  worker.work();
  worker =RoboticWorker();
  worker.work();
}