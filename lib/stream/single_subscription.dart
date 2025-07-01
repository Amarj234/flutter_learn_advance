import 'dart:async';

void main() {
  // Create a single-subscription stream controller
  final controller = StreamController<int>(); // <-- no .broadcast()

  // Listener 1 (allowed)
  controller.stream.listen((data) {
    print('Listener received: $data');
  });

  // Uncommenting this will throw a StateError
  /*
  controller.stream.listen((data) {
    print('Listener 2 received: $data');
  });
  */

  // Emit some data
  controller.add(10);
  controller.add(20);

  controller.close();

  // Example using async* stream directly (single subscription)
  getNumbers()
      .where((n) => n.isEven) // Filter even numbers
      .map((n) => 'Number: $n') // Transform into string
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
