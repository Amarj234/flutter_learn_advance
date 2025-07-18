import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AnimationDemoPage(),
  ));
}

class AnimationDemoPage extends StatefulWidget {
  @override
  _AnimationDemoPageState createState() => _AnimationDemoPageState();
}

class _AnimationDemoPageState extends State<AnimationDemoPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Offset> _slideAnimation;
  late Animation<Alignment> _alignAnimation;
  late Animation<RelativeRect> _positionedAnimation;
  late Animation<Decoration> _decorationAnimation;
//  late Animation<CurvedAnimation> _curvedAnimation;

  // Offset a = Offset(10, 5);
// Offset b = Offset(3, 2);

// Offset sum = a + b;   // Offset(13,7)
// Offset diff = a - b;  // Offset(7,3)
// Offset scaled = a.scale(2, 3); // Offset(20,15)
// double len = a.distance; // sqrt(10^2 + 5^2) ≈ 11.18

// | Tween type          | Use                                       |
// | ------------------- | ----------------------------------------- |
// | `Tween<double>`     | Numbers (opacity, scale)                  |
// | `ColorTween`        | Colors                                    |
// | `AlignmentTween`    | Align widget in a container               |
// | `SizeTween`         | Animate size                              |
// | `RectTween`         | Animate rectangles                        |
// | `RelativeRectTween` | Animate positioned widgets inside `Stack` |
// | `DecorationTween`   | Animate `BoxDecoration`                   |
// | `EdgeInsetsTween`   | Animate padding or margin                 |
// | `BorderRadiusTween` | Animate border radius                     |
// | `IntTween`          | Animate integers                          |
// | `OffsetTween`       | Animate `Offset` for positions/slides     |



// | Animation type           | Used for                                          |
// | ------------------------ | ------------------------------------------------- |
// | `CurvedAnimation`        | Apply a curve (bounce, ease) to another animation |
// | `Tween<T>.animate()`     | Interpolate values of type `T` over time          |
// | `ReverseAnimation`       | Play another animation backwards                  |
// | `TrainHoppingAnimation`  | Seamlessly switch between two animations          |
// | `AlwaysStoppedAnimation` | Fixed value, never changes                        |
// | `ProxyAnimation`         | Swap animation sources at runtime                 |




  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(1, 0),
    ).animate(_animation);

    _alignAnimation = AlignmentTween(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(_animation);

    _positionedAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(0, 0, 300, 300),
      end: RelativeRect.fromLTRB(300, 300, 0, 0),
    ).animate(_animation);

    _decorationAnimation = DecorationTween(
      begin: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(0)),
      end: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(30)),
    ).animate(_animation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Animation Widgets"),actions: [ElevatedButton(onPressed: (){

        _controller.stop();
      }, child: Text("stop")),
      ElevatedButton(onPressed: (){

        _controller.repeat(reverse: true);
      }, child: Text("repeat"))
      ],),


      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [

              // FadeTransition
              FadeTransition(
                opacity: _animation,
                child: demoBox("Fade"),
              ),

              SizedBox(height: 20),

              // ScaleTransition
              ScaleTransition(
                scale: _animation,
                child: demoBox("Scale"),
              ),

              SizedBox(height: 20),

              // SizeTransition
              SizeTransition(
                sizeFactor: _animation,
                axis: Axis.horizontal,
                axisAlignment: -1,
                child: demoBox("Size"),
              ),

              SizedBox(height: 20),

              // SlideTransition
              SlideTransition(
                position: _slideAnimation,
                child: demoBox("Slide"),
              ),

              SizedBox(height: 20),

              // RotationTransition
              RotationTransition(
                turns: _animation,
                child: demoBox("Rotate"),
              ),

              SizedBox(height: 20),

              // AlignTransition
              Container(
                height: 100,
                color: Colors.grey.shade200,
                child: AlignTransition(
                  alignment: _alignAnimation,
                  child: demoBox("Align", small: true),
                ),
              ),

              SizedBox(height: 20),

              // PositionedTransition inside Stack
             Container(
              color: Colors.yellow.withValues(alpha: .1),
  height: 200,
  width: double.infinity, // ensure it takes available width
  child: LayoutBuilder(
    builder: (context, constraints) {
      final width = constraints.maxWidth;
      final height = constraints.maxHeight;

       _positionedAnimation = RelativeRectTween(
        begin: RelativeRect.fromLTRB(0, 0, width - 100, height - 100),
        end: RelativeRect.fromLTRB(width - 100, height - 100, 0, 0),
      ).animate(_animation);

      return Stack(
        children: [
          PositionedTransition(
            rect: _positionedAnimation,
            child: demoBox("Position", small: true),
          ),
        ],
      );
    },
  ),
)
,

              SizedBox(height: 20),

              // DecoratedBoxTransition
              DecoratedBoxTransition(
                decoration: _decorationAnimation,
                child: Container(
                  height: 50,
                  width: 150,
                  alignment: Alignment.center,
                  child: Text("Decorate", style: TextStyle(color: Colors.white)),
                ),
              ),


//               AnimatedBuilder(
//         animation: _controller,
//         builder: (context, child) {
//           print("build ${_animation.value}");
//           return Stack(
//             children: [
//               Positioned(
//                 top:  _animation.value*500,
                
//                             left: _animation.value*1000,// shows 70% height
//                 child: Image.asset("assets/amarjeet.jpg"),
//               ),
//             ],
//           )

// ;
//         },
//       ),

            ],
          ),
        ),
      ),
    );
  }

  Widget demoBox(String label, {bool small = false}) {
    return Container(
      height: small ? 40 : 60,
      width: small ? 80 : 100,
      alignment: Alignment.center,
      color: Colors.blueAccent,
      child: Text(label, style: TextStyle(color: Colors.white)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
