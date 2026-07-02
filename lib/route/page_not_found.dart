import 'package:flutter/material.dart';

class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({super.key, this.route = ""});
  final String route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Not Found'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Text('404 - Page Not Found ($route)',
            style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
