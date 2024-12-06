import 'package:flutter/material.dart';

import 'models/chart_bar_data.dart';
import 'models/chart_linker_data.dart';

class ChartLinker extends StatefulWidget {
  final List<ChartLinkerData> items;
  const ChartLinker({super.key, required this.items});

  @override
  State<ChartLinker> createState() => _ChartLinkerState();
}

class _ChartLinkerState extends State<ChartLinker> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: const Size(100, 300),
        painter: LinkerPainter(widget.items),
      ),
    );
  }
}

class LinkerPainter extends CustomPainter {
  final List<ChartLinkerData> items;
  LinkerPainter(this.items);

@override
void paint(Canvas canvas, Size size) {

  double x = 0;
  double previousY1 = 0, previousY2 = 0, previousY3 = 0, previousY4 = 0;
  const double padding = 10.0;
  const double borderRadius = 8.0; // Set border radius here

  for (var item in items) {
    // Calculate new y-coordinates
    double currentY1 = (previousY4 == 0) ? 0 : previousY4 + padding;
    double currentY2 = (previousY3 == 0) ? 0 : previousY3 + padding;
    // double currentY3 = currentY2 + size.height * item.h2;
    // double currentY4 = currentY1 + size.height * item.h1;
    double currentY3 = currentY2 + item.h2;
    double currentY4 = currentY1 +  item.h1;
    // Set paint properties
    Paint paint = Paint()
      ..color = item.color.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    // Create and draw the path with border radius
    Path path = Path();

    // Start path with rounded corner
    path.moveTo(x + borderRadius, currentY1);

    // Top-right corner with quadratic Bezier curve
    path.lineTo(size.width - borderRadius, currentY2);
    path.quadraticBezierTo(size.width, currentY2, size.width, currentY2 + borderRadius);

    // Bottom-right corner with quadratic Bezier curve
    path.lineTo(size.width, currentY3 - borderRadius);
    path.quadraticBezierTo(size.width, currentY3, size.width - borderRadius, currentY3);

    // Bottom-left corner with quadratic Bezier curve
    path.lineTo(borderRadius, currentY4);
    path.quadraticBezierTo(0, currentY4, 0, currentY4 - borderRadius);

    // Top-left corner with quadratic Bezier curve
    path.lineTo(0, currentY1 + borderRadius);
    path.quadraticBezierTo(0, currentY1, x + borderRadius, currentY1);

    path.close();

    // Draw the path
    canvas.drawPath(path, paint);

    // Update previous y-coordinates for the next iteration
    previousY1 = currentY1;
    previousY2 = currentY2;
    previousY3 = currentY3;
    previousY4 = currentY4;
  }





}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
  return false;
}
}