import 'package:objectbox/objectbox.dart';

import '../../common/common_export.dart';

class PrintPath extends StatefulWidget {
  const PrintPath({super.key});

  @override
  State<PrintPath> createState() => _PrintPathState();
}

class _PrintPathState extends State<PrintPath> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: CustomPaint(
        size: Size(Get.width, Get.height),
        painter: CustomPathPainter([
          Offset(50, 100),
          Offset(150, 200),
          Offset(250, 50),
          Offset(350, 300),
          Offset(450, 150),
        ]),
      ),
    );
  }
}

class CustomPathPainter extends CustomPainter {
  final List<Offset> points;

  CustomPathPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;

    // canvas.translate(Get.width/2, Get.height/2);

    if (points.isEmpty) return;

    final path = Path()..moveTo(points[0].dx, points[0].dy);
    for (var point in points.skip(1)) {
      path.lineTo(point.dx, point.dy);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
