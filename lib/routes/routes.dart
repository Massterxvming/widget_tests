
import 'package:flutter/material.dart';
import 'package:widget_test/page/app_root.dart';

import '../page/cupertino_page.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => const AppRoot(title: 'Flutter Demo Home Page'),
  // '/cupertino_page':(context) => const CupertinoPage(),
};

abstract class Routes{
  Routes();

  static String home =  '/';

  static String cupertinoPage = '/cupertino_page';
}