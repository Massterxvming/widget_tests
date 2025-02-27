import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_test/widgetState/widget_for_vca/tab_button.dart';

class CupertinosPage extends StatefulWidget {
  final String title;
  const CupertinosPage({super.key, required this.title,});

  @override
  State<CupertinosPage> createState() => _CupertinosPageState();
}

class _CupertinosPageState extends State<CupertinosPage> {
  int currentIndex = 0;
  late String title;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.title;
  }

  @override
  void didUpdateWidget(covariant CupertinosPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(widget.title!= oldWidget.title){
      print('title changed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CupertinoTabBar(
          height: 90,
          backgroundColor: Colors.green,
          // activeColor: Colors.red,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: FittedBox(
                fit: BoxFit.cover,
                child: TabButton(),
              ),
            ),
            BottomNavigationBarItem(
              icon: FittedBox(
                fit: BoxFit.cover,
                child: TabButton(),

              ),
            ),
            BottomNavigationBarItem(
              icon: FittedBox(
                fit: BoxFit.fill,
                child: TabButton(),
              ),
            ),

          ],
        ),
        body: Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}

class CustomShape extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..color = Colors.black;

    Path path = Path()
     ..moveTo(0, size.height)
     ..lineTo(size.width, size.height)
     ..lineTo(size.width, 0)
     ..lineTo(0, 0)
     ..close();


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}