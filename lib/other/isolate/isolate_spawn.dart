import 'dart:isolate';

void backgroundTask(SendPort sendPort) {
  // Do heavy work
  final result = List.generate(100000000, (i) {  return i * i;});
  sendPort.send(result);
}

void runHeavyWork() async {
  final receivePort = ReceivePort();

  await Isolate.spawn(backgroundTask, receivePort.sendPort);

  receivePort.listen((message) {
    print("$message Got result: ${message.length}");
    receivePort.close();
  });
}

main() {

runHeavyWork();
}
