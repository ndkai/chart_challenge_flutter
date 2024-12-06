import 'package:flutter/material.dart';

import 'models/chart_bar_data.dart';

class ChartBar extends StatefulWidget {
  final List<ChartBarData> items;
  const ChartBar({super.key, required this.items});

  @override
  State<ChartBar> createState() => _ChartBarState();
}

class _ChartBarState extends State<ChartBar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: const Size(100, 300),
        painter: TwoRectanglesPainter(widget.items),
      ),
    );
  }
}

class TwoRectanglesPainter extends CustomPainter {
  final List<ChartBarData> items;

  TwoRectanglesPainter(this.items);
  @override
  void paint(Canvas canvas, Size size) {
    double x = 0;
    double y = size.height; // Start from the bottom
    double padding = 10;

    for (var item in items) {
      Paint paint = Paint()
        ..color = item.color
        ..style = PaintingStyle.fill;

      // Create RRect with border radius
      RRect roundedRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y - item.percent, size.width, item.percent), // Adjust y position
        const Radius.circular(10), // Border radius
      );

      // Draw the rounded rectangle
      canvas.drawRRect(roundedRect, paint);

      // Update y position to move upwards
      y -= item.percent + padding;
    }
  }


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Không cần vẽ lại nếu không thay đổi.
  }
}