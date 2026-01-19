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

class ScratchPage extends StatelessWidget {
  const ScratchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onPanUpdate: (_) {},
        child: const Center(
          child: Text(
            '空白草稿纸',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
