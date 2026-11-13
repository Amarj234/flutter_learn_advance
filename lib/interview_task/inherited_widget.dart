class MyInheritedWidget extends InheritedWidget {
  final String username;

  const MyInheritedWidget({
    super.key,
    required this.username,
    required super.child,
  });

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<
        MyInheritedWidget>()!;
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return username != oldWidget.username;
  }
}


void main() {
  runApp(
    MyInheritedWidget(
      username: "Amarjeet",
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = MyInheritedWidget.of(context);

    return Scaffold(
      body: Center(
        child: Text("Hello ${user.username}"),
      ),
    );
  }
}
