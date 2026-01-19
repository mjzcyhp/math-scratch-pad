import 'package:flutter/material.dart';

void main() {
  runApp(const MathScratchApp());
}

class MathScratchApp extends StatelessWidget {
  const MathScratchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ScratchPage(),
    );
  }
}

class ScratchPage extends StatefulWidget {
  const ScratchPage({super.key});

  @override
  State<ScratchPage> createState() => _ScratchPageState();
}

class _ScratchPageState extends State<ScratchPage> {
  List<Offset?> points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            RenderBox box = context.findRenderObject() as RenderBox;
            points.add(box.globalToLocal(details.globalPosition));
          });
        },
        onPanEnd: (_) => points.add(null),
        child: CustomPaint(
          painter: ScratchPainter(points),
          size: Size.infinite,
        ),
      ),
    );
  }
}

class ScratchPainter extends CustomPainter {
  final List<Offset?> points;
  ScratchPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(ScratchPainter oldDelegate) => true;
}
