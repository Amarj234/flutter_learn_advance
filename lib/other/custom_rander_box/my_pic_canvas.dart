import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: CustomPainterPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class CustomPainterPage extends StatefulWidget {
  @override
  State<CustomPainterPage> createState() => _CustomPainterPageState();
}

class _CustomPainterPageState extends State<CustomPainterPage> {
  List<List<Color>>? _pixels;
  double _colorAmount = 0.0;
  int _imgWidth = 0;
  int _imgHeight = 0;
  bool _isLoading = true;
  String? _error;
  double _pixelSize = 4.0;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      // Load image from assets
      final data = await rootBundle.load('assets/amarjeet.jpg');
      final bytes = Uint8List.view(data.buffer);
      final img = await decodeImageFromList(bytes);

    //print("Image bytes $bytes");
      // Get image dimensions
      _imgWidth = img.width;
      _imgHeight = img.height;

      // Convert to byte data
      final byteData = await img.toByteData(format: ui.ImageByteFormat.rawRgba);

   
      if (byteData == null) {
        throw Exception("Failed to get byte data from image");
      }
      final pixelsList = byteData.buffer.asUint8List();
print("pixelsList ${pixelsList}");

      // Process pixels in parallel for better performance
      final tempPixels = await _processPixelsParallel(pixelsList, img.width, img.height);

      setState(() {
        _pixels = tempPixels;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = "Error loading image: $e";
        _isLoading = false;
      });
    }
  }

  Future<List<List<Color>>> _processPixelsParallel(Uint8List pixelsList, int width, int height) async {
    // Create an empty pixel grid
    final tempPixels = List.generate(height, (_) => List.filled(width, Colors.transparent));

    // Process pixels in parallel using isolates for better performance
    await Future.wait([
      for (int y = 0; y < height; y++)
        Future.microtask(() {
          for (int x = 0; x < width; x++) {
            final i = (y * width + x) * 4;
            tempPixels[y][x] = Color.fromARGB(
              pixelsList[i + 3],
              pixelsList[i],
              pixelsList[i + 1],
              pixelsList[i + 2],
            );
          }
        }),
    ]);

    return tempPixels;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Advanced Image Colorizer"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadImage,
            tooltip: "Reload Image",
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _buildMainContent(),
            ),
          ),
          _buildControls(),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    if (_error != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 48),
          const SizedBox(height: 16),
          Text(
            _error!,
            style: const TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _loadImage,
            child: const Text("Try Again"),
          ),
        ],
      );
    }

    if (_isLoading) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text("Loading image..."),
        ],
      );
    }

    if (_pixels == null) {
      return const Text("No image data available");
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: CustomPaint(
          painter: AdvancedColorPainter(
            _pixels!,
            _colorAmount,
            pixelSize: _pixelSize,
          ),
          size: Size(_imgWidth.toDouble(), _imgHeight.toDouble()),
        ),
      ),
    );
  }

  Widget _buildControls() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              const Text("Color:"),
              Expanded(
                child: Slider(
                  value: _colorAmount,
                  onChanged: (val) => setState(() => _colorAmount = val),
                  min: 0,
                  max: 1,
                ),
              ),
              Text("${(_colorAmount * 100).round()}%"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              const Text("Pixel Size:"),
              Expanded(
                child: Slider(
                  value: _pixelSize,
                  onChanged: (val) => setState(() => _pixelSize = val),
                  min: 1,
                  max: 10,
                  divisions: 9,
                ),
              ),
              Text("${_pixelSize.round()}px"),
            ],
          ),
        ),
      ],
    );
  }
}

class AdvancedColorPainter extends CustomPainter {
  final List<List<Color>> pixels;
  final double colorAmount;
  final double pixelSize;

  AdvancedColorPainter(this.pixels, this.colorAmount, {this.pixelSize = 4.0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = false; // Better performance for pixelated look

    final pixelRect = Rect.fromLTWH(0, 0, pixelSize, pixelSize);
    final matrix4 = Matrix4.identity();
    final rects = <Rect>[];
    final colors = <Color>[];

    // Pre-calculate all pixel rectangles and colors
    for (int y = 0; y < pixels.length; y += pixelSize.ceil()) {
      for (int x = 0; x < pixels[0].length; x += pixelSize.ceil()) {
        final color = pixels[y][x];
        final gray = _calculateLuminance(color);
        final newColor = _blendColor(color, gray);
        
        rects.add(pixelRect.translate(x.toDouble(), y.toDouble()));
        colors.add(newColor);
      }
    }

    // Draw all pixels in a single batch for better performance
    canvas.save();
    for (int i = 0; i < rects.length; i++) {
      paint.color = colors[i];
      canvas.drawRect(rects[i], paint);
    }
    canvas.restore();
  }

  int _calculateLuminance(Color color) {
    // Using perceptual luminance formula
    return (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue).round();
  }

  Color _blendColor(Color original, int gray) {
    if (colorAmount == 0) {
      return Color.fromARGB(original.alpha, gray, gray, gray);
    } else if (colorAmount == 1) {
      return original;
    }

    return Color.fromARGB(
      original.alpha,
      (gray * (1 - colorAmount) + original.red * colorAmount).round(),
      (gray * (1 - colorAmount) + original.green * colorAmount).round(),
      (gray * (1 - colorAmount) + original.blue * colorAmount).round(),
    );
  }

  @override
  bool shouldRepaint(covariant AdvancedColorPainter oldDelegate) {
    return oldDelegate.colorAmount != colorAmount ||
        oldDelegate.pixelSize != pixelSize ||
        oldDelegate.pixels != pixels;
  }
}