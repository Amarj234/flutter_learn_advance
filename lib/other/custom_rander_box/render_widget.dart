import 'package:flutter/material.dart';
import 'render_radial_progress.dart';

class RadialExample extends StatefulWidget {
  const RadialExample({super.key});

  @override
  State<RadialExample> createState() => _RadialExampleState();
}

class _RadialExampleState extends State<RadialExample> {
  double _progress = 0.4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Radial Progress")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadialProgress(progress: _progress),
            const SizedBox(height: 20),
            Slider(
              value: _progress,
              onChanged: (v) => setState(() => _progress = v),
            ),
          ],
        ),
      ),
    );
  }
}
