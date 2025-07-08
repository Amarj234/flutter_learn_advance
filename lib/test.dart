import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(home:MyWidget()));
}


class MyWidget extends StatefulWidget { 
  

  @override
State<MyWidget> createState()=> _MyWidgetState();


 }

class _MyWidgetState extends State<MyWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 5), vsync: this);
    _sizeAnim = Tween<double>(begin: 10, end: 2000).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Container(
          width: _sizeAnim.value,
          height: _sizeAnim.value,
          color: Colors.green,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
