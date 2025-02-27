import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:widget_test/controller/app_controller.dart';

import '../Tool/toast_manager.dart';
import '../dataBase/object_data.dart';
import '../routes/routes.dart';
import '../widgetState/outlinedButton.dart';
import '../widgetState/widgetStateController.dart';
import 'cupertino_page.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key, required this.title});

  final String title;

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  int _counter = 0;

  String pageTitle = 'Cupertino Page';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  _modifyPageTitle() {
    pageTitle = 'New Page Title';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                            CupertinoButton(
                                child: Text('Cancel'),
                                onPressed: () {
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
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CupertinoButton(
                    child: Text('添加多个'),
                    onPressed: () async {
                      setState(() {
                        ObjectData.instance.setCurrentAccountFriends();
                      });
                    },
                  ),
                  CupertinoButton(
                    child: Text('添加一个'),
                    onPressed: () async {
                      setState(() {
                        ObjectData.instance.setCurrentAccountBob();
                      });
                    },
                  ),
                  CupertinoButton(
                    child: Text('清除所有'),
                    onPressed: () async {
                      setState(() {
                        ObjectData.instance.clearall();
                      });
                    },
                  ),
                  CupertinoButton(
                    child: Text('设置别的用户'),
                    onPressed: () async {
                      setState(() {
                        ObjectData.instance.setOtherAccount();
                      });
                    },
                  ),
                ],
              ),
            ),
            CupertinoButton(
                child: Text('go to cupertino page'),
                onPressed: () {
                  Get.to(()=>CupertinosPage(title: pageTitle));
                  // Navigator.of(context).pushNamed(Routes.cupertinoPage);
                },
                ),
            FilledButton.tonal(onPressed: (){
              _modifyPageTitle();
            }, child: Text('改变传入字符'),),
            MaterialButton(
              mouseCursor: MouseCursor.defer,
              autofocus: true,
              onPressed: () {
                var cancel = BotToast.showLoading();
                Future.delayed(const Duration(seconds: 10)).then((value) {
                  cancel();
                });
                appController.initEws().then((value) {
                  cancel();
                  // BotToast.showText(text: "ews init success");
                });
              },
              child: const Text('ews test'),
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
