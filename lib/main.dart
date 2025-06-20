
import 'package:flutter/material.dart';
import 'package:learn_more/api/api_retry.dart';
import 'other/custom_rander_box/render_widget.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MyAppData(
      notifier: MyAppNotifier(),
      child: const MaterialApp(
        home: RadialExample(),
      ),
    );
  }
}

class MyAppNotifier extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    fetchData();
    _counter++;
    notifyListeners();
  }
}

class MyAppData extends InheritedWidget {
  final MyAppNotifier notifier;

  const MyAppData({
    required this.notifier,
    required super.child,
    super.key,
  });

  static MyAppNotifier of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<MyAppData>()!
        .notifier;
  }

  @override
  bool updateShouldNotify(MyAppData oldWidget) {
    return notifier != oldWidget.notifier;

  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final notifier = MyAppData.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('ChangeNotifier + InheritedWidget')),
      body: Center(
        child: AnimatedBuilder(
          animation: notifier,
          builder: (context, _) {

            return Text('Counter: ${notifier.counter}');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: notifier.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}