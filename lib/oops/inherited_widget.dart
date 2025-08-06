



import 'package:flutter/material.dart';

class CounterData extends InheritedWidget {
  final int counter;
  final void Function() increment;

  const CounterData({
    required this.counter,
    required this.increment,
    required super.child,
    super.key,
  });

  // Method to access the widget from below in the tree
  static CounterData of(BuildContext context) {
    final CounterData? result =
    context.dependOnInheritedWidgetOfExactType<CounterData>();
    assert(result != null, 'No CounterData found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(CounterData oldWidget) {
    // Rebuild dependents only if counter has changed
    return oldWidget.counter != counter;
  }
}
