import 'package:flutter/material.dart';


main(){
  runApp(MaterialApp(home:Mywidget()));
}

class Mywidget extends StatefulWidget {
  @override
  State<Mywidget> createState() => _Mywidget();
}

class _Mywidget extends State<Mywidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 10));

    _animation = Tween<double>(begin: 1, end: .01).animate(_animationController);

    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          print("build ${_animation.value}");
          return Stack(
            children: [
              Positioned(
                top:  _animation.value*500,
                
                            left: _animation.value*1000,// shows 70% height
                child: Image.asset("assets/amarjeet.jpg"),
              ),
            ],
          )

;
        },
      ),
    ));
  }
}
