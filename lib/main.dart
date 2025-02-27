import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_test/page/app_root.dart';
import 'package:widget_test/routes/routes.dart';

import 'controller/app_controller.dart';
import 'dataBase/object_data.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ObjectData.instance.init();
  await AppController.instance.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        tabBarTheme: const TabBarTheme(dividerColor: Colors.transparent),
      ),
      initialRoute: '/',
      routes: routes,
    );
  }
}


