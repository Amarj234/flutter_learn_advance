import 'dart:isolate';

void main(List<String> args, SendPort sendPort) {
  // Simulate heavy computation
  final result = args.map((e) => 'Hello $e').toList();

  // Send result back
  sendPort.send(result);
}


