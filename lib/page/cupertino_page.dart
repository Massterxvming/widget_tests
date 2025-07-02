import 'package:deepseek_api/deepseek_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:widget_test/deepseek_client/deepseek_client.dart';
import 'package:widget_test/widgetState/widget_for_vca/tab_button.dart';
import 'dart:ui' as ui;

class CupertinosPage extends StatefulWidget {
  final String title;

  const CupertinosPage({
    super.key,
    required this.title,
  });

  @override
  State<CupertinosPage> createState() => _CupertinosPageState();
}

class _CupertinosPageState extends State<CupertinosPage> {
  int currentIndex = 0;
  late String title;
  DeepSeekClient? deepSeek;
  String question = "";
  String answer = "";
  TextEditingController _textController = TextEditingController();

  void InitDeepSeek() {
    deepSeek = DeepSeekClient(
      apiKey: 'sk-6342225df7954f08b116a2f7cc097c0c',
      // Optional: baseUrl: 'https://api.deepseek.com/v1' (default)
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.title;
    // _voidInitDeepSeek();
  }

  @override
  void didUpdateWidget(covariant CupertinosPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.title != oldWidget.title) {
      print('title changed');
    }
  }

  Future<void> _deepSeekTopic() async { 
    final response = await deepSeekClient.createChatCompletion(
      ChatCompletionRequest(
        model: 'deepseek-chat',
        messages: [ChatMessage(role: 'user', content: question,),],
        temperature: 0.7,
        maxTokens: 100,
      ),
    );
    setState(() {
      answer = response.choices.first.message.content;
    });
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
        body: Column(
          children: [
            Container(
              color: Colors.blue,
            ),
            TextField(
              controller: _textController,
              onChanged: (value) {
                question = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                _deepSeekTopic();
              },
              child: Text('DeepSeek Topic'),
            ),
            Text(
              answer,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomShape extends CustomPainter {
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
