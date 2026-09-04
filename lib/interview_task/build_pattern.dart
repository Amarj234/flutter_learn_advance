class Computer {
  final int ram;
  final int storage;
  final String cpu;
  final int graphics;

  Computer._(this.ram,this.storage,this.cpu,this.graphics);
  showConfig() {
    print("Ram $ram");
    print("Storage $storage");
    print("Cpu $cpu");
    print("Graphics $graphics");
  }
}

class BuildComputer{
  int _ram=8;
  String _cpu="inteli5";
  int _storage=512;
  int _graphics=12;

  BuildComputer setCpu(String cpu){
    _cpu =cpu;
    return this;
  }

  BuildComputer setRam(int ram){
    _ram= ram;
    return this;
  }

  BuildComputer setStorage(int  storage){
    _storage= storage;
    return this;
  }

  BuildComputer setGraphics(int graphincs){
    _graphics= graphincs;
    return this;
  }

  Computer build(){
    return Computer._(_ram, _storage, _cpu, _graphics);
  }
}

main(){
  Computer computer=BuildComputer().setCpu("m1").setRam(16).setStorage(512).setGraphics(12).build();

  computer.showConfig();
}