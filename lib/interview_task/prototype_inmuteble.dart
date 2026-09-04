
class Computer {
  final int ram;
  final int cpu;
  final int storage;
  Computer({required this.storage,required this.cpu,required this.ram});

  Computer copyWith({int? ram,int? cpu,int? storage}){
    return Computer(cpu: cpu??this.cpu,ram: ram??this.ram,storage: storage??this.storage);
  }
  void showSpecs() {
    print("Specs -> RAM: ${ram}GB, CPU: ${cpu} Cores, Storage: ${storage}GB");
  }

}


main(){
  Computer computer=Computer(storage: 526, cpu: 22, ram: 16);
  computer.showSpecs();


  Computer newComputer= computer.copyWith(storage: 256,ram: 8,cpu: 10);
  newComputer.showSpecs();
}