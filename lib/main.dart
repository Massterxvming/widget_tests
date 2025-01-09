import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_test/Tool/toast_manager.dart';
import 'package:widget_test/widgetState/outlinedButton.dart';
import 'package:widget_test/widgetState/widgetStateController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Widgetstatecontroller(),
            const Outlinedbutton(),
            CupertinoButton(
              child: Icon(Icons.adb),
              onPressed: () async {
                BotToast.showText(text: "Hello, world!");
                BotToast.showSimpleNotification(title: 'title');
                var cancel = BotToast.showWidget(toastBuilder: (v) {
                  return SafeArea(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Material(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Hello, world!'),
                            SizedBox(width: 10),
                            CupertinoButton(child: Text('Cancel'), onPressed: (){
                              // BotToast.cleanAll();
                              appToast.close?.call();
                              print('cancel');
                            })
                          ],
                        ),
                      ),
                    ),
                  );
                });
                appToast.close = cancel;

                // var cancelLoading = BotToast.showLoading();
                // await Future.delayed(const Duration(seconds: 2));
                // cancelLoading();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
