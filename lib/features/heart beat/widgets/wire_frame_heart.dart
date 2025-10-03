import 'package:flutter/material.dart';

class WireframeHeart extends StatelessWidget {
  const WireframeHeart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CustomPaint(
          size: const Size(300, 300),
          painter: HeartWireframePainter(),
        ),
      ),
    );
  }
}

class HeartWireframePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.cyanAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final Path path = Path();
    double w = size.width;
    double h = size.height;

    // رسم مسار القلب
    path.moveTo(w / 2, h * 0.75);
    path.cubicTo(w * 1.2, h * 0.4, w * 0.8, h * 0.05, w / 2, h * 0.3);
    path.cubicTo(w * 0.2, h * 0.05, w * -0.2, h * 0.4, w / 2, h * 0.75);

    // رسم الحدود
    canvas.drawPath(path, paint);

    // خطوط شبكية داخلية (Wireframe)
    for (int i = 1; i < 6; i++) {
      double t = i / 6;
      Path innerPath = Path();
      innerPath.moveTo(w / 2, h * (0.3 + 0.45 * t));
      innerPath.quadraticBezierTo(
          w * (0.8 - 0.3 * t), h * (0.2 + 0.5 * t), w / 2, h * (0.3 + 0.45 * t));
      canvas.drawPath(innerPath, paint..color = Colors.pinkAccent);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
