import 'dart:async';

void main() {
  print("1. Sync Start");

  scheduleMicrotask(() => print("2. Microtask A"));

  Future.microtask(() => print("3. Microtask B"));

  Future(() => print("6. Event Future"));

  Future.delayed(Duration.zero, () => print("7. Event Delayed"));

  Timer.run(() => print("8. Timer"));

  print("4. Sync End");
}

//output

// 1. Sync Start
// 4. Sync End
// 2. Microtask A
// 3. Microtask B
// 6. Event Future
// 7. Event Delayed
// 8. Timer
