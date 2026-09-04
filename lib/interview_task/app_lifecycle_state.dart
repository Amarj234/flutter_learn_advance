import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: LifecycleExample()));

class LifecycleExample extends StatefulWidget {
  const LifecycleExample({super.key});

  @override
  State<LifecycleExample> createState() => _LifecycleExampleState();
}

// 1. Add the WidgetsBindingObserver mixin to your State class
class _LifecycleExampleState extends State<LifecycleExample> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();

    // 2. Register this class as an observer of the lifecycle system
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // 3. Always remove the observer when the widget is destroyed
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // 4. Override this method to intercept lifecycle updates
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    print("🔄 Current App State: $state");

    switch (state) {
      case AppLifecycleState.resumed:
        print("☀️ App is in foreground (Resume animations/network tracking)");
        break;
      case AppLifecycleState.inactive:
        print("🌫️ App lost focus (Pause active gameplay or video streams)");
        break;
      case AppLifecycleState.hidden:
        print("🙈 App views are completely hidden");
        break;
      case AppLifecycleState.paused:
        print("🌙 App is minimized (Save unsaved local data drafts)");
        break;
      case AppLifecycleState.detached:
        print("💀 App is terminating (Close active socket links)");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Minimize or leave the app to see lifecycle changes.')),
    );
  }
}
