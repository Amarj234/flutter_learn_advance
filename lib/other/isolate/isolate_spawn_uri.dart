import 'dart:isolate';


void main() {
  runIsolate();
}

  String result = 'Waiting...';

  Future<void> runIsolate() async {
    final receivePort = ReceivePort();

    final uri = Uri.parse('heavy_worker.dart');

    await Isolate.spawnUri(
      uri,
      ['World', 'Flutter'],
      receivePort.sendPort,
    );

    receivePort.listen((message) {
     
        result = message.toString();
   print(" main: Got result: $result");
      receivePort.close();
    });
  }


