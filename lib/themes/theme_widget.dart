
import 'themes.dart';
import 'package:flutter/material.dart';


void main() {
  // This file is a placeholder for the theme widget.
  // You can implement your theme widget here.
runApp(ThemeWidget());
}

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Widget',
      theme:MyThemes.getThemeData(context,themval: 1),// here you can set your theme 0 or 1
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Theme Widget Example'),
        ),
        body: Center(
          child: const Text('This is a theme widget example.'),
        ),
      ),
    );
  }
}