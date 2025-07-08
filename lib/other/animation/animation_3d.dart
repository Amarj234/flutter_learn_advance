import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  runApp(MaterialApp(home:FlipCardDemo()));
  
}


class FlipCardDemo extends StatefulWidget {
  const FlipCardDemo({super.key});

  @override
  State<FlipCardDemo> createState() => _FlipCardDemoState();
}

class _FlipCardDemoState extends State<FlipCardDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
  }

  void _toggleCard() {
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _isFront = !_isFront;
  }

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.slowMiddle),
    );

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: GestureDetector(
          onTap: _toggleCard,
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              final angle = animation.value * pi;
              final isUnder = angle > pi / 2;

              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001) // perspective
                  ..rotateY(angle),
                child: isUnder
                    ? _buildBack()
                    : _buildFront(), // alternate view
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFront() {
    return _buildCard(
      color: Colors.blueAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star, size: 60, color: Colors.white),
          SizedBox(height: 10),
          Text("FRONT", style: TextStyle(color: Colors.white, fontSize: 24)),
        ],
      ),
    );
  }

  Widget _buildBack() {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateY(pi),
      child: _buildCard(
        color: Colors.deepOrange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock, size: 60, color: Colors.white),
            SizedBox(height: 10),
            Text("BACK", style: TextStyle(color: Colors.white, fontSize: 24)),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child, required Color color}) {
    return Container(
      width: 250,
      height: 350,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: 5,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
