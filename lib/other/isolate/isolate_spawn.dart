import 'dart:isolate';

void backgroundTask(SendPort sendPort) {
  // Do heavy work
  final result = List.generate(100000000, (i) { print("object $i"); return i * i;});
  sendPort.send(result);
}

void runHeavyWork() async {
  final receivePort = ReceivePort();

  await Isolate.spawn(backgroundTask, receivePort.sendPort);

  receivePort.listen((message) {
    print("Got result: ${message.length}");
    receivePort.close();
  });
}

main() {
  List.generate(100000000, (i) { print("object $i"); return i * i;});
//runHeavyWork();
}
