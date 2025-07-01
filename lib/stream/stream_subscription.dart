

import 'package:rxdart/rxdart.dart';

void main() async {
  Stream<int> numbers = Stream.periodic(Duration(seconds: 1), (i) => i);

  final subscription = numbers.listen((data) {
    print('Received: $data');
  });

  await Future.delayed(Duration(seconds: 3));
  print('Pausing...');
  subscription.pause();

  await Future.delayed(Duration(seconds: 3));
  print('Resuming...');
  subscription.resume();

  await Future.delayed(Duration(seconds: 3));
  print('Cancelling...');
  await subscription.cancel();












/// Advanced: Combining multiple streams with rxdart



   final nameController = BehaviorSubject<String>();
  final ageController = BehaviorSubject<int>();

  CombineLatestStream.combine2(
    nameController.stream,
    ageController.stream,
    (String name, int age) => '$name is $age years old',
  ).listen((data) {
    print(data);
  });

  nameController.add('Alice');
  ageController.add(30); // prints: Alice is 30 years old

  nameController.add('Bob'); // prints: Bob is 30 years old

  ageController.add(25);     // prints: Bob is 25 years old

  nameController.close();
  ageController.close();
}
