import 'dart:async';

void main() {
  // Create a broadcast stream that allows multiple listeners
  final controller = StreamController<int>.broadcast();

  // Listener 1
  controller.stream.listen((data) {
    print('Listener 1 received: $data');
  });

  // Listener 2
  controller.stream.listen((data) {
    print('Listener 2 received: $data');
  });

  // Emit some data
  controller.add(10);
  controller.add(20);

  controller.close();

  // filter stream 

    getNumbers()
    .where((n) => n.isEven)       // Filter even numbers
    .map((n) => 'Number: $n')      // Transform into a string
    .listen((val) {
      print(val); // prints Number: 2 and Number: 4
    });

}

Stream<int> getNumbers() async* {
  yield 1;
  yield 2;
  yield 3;
  yield 4;
}



