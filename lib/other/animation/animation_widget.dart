import 'package:flutter/material.dart';

class MyAnimationWidget extends StatefulWidget {
  @override
  _MyAnimationWidgetState createState() => _MyAnimationWidgetState();
}

class _MyAnimationWidgetState extends State<MyAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.5)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: FlutterLogo(size: 100),
    );
  }

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Animation Widget')),
  //     body: Center(
  //       child: AnimatedBuilder(
  //         animation: _controller,
  //         builder: (context, child) {
  //           return Transform.rotate(
  //             angle: _controller.value * 2 * 3.14,
  //             child: child,
  //           );
  //         },
  //         child: Icon(Icons.refresh, size: 50),
  //       )
  //       ,
  //     ),
  //   );
  // }
// bool  isExpanded = false;
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Animation Widget')),
//       body: Center(
//         child: AnimatedContainer(
//           duration: Duration(seconds: 1),
//           curve: Curves.easeInOut,
//           width: isExpanded ? 200 : 100,
//           height: 100,
//           color: isExpanded ? Colors.blue : Colors.red,
//         ),
//
//       ),
//     );
//   }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
