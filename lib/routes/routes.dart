
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_test/page/app_root.dart';
import 'package:widget_test/page/custom_print_page/custom_print_page.dart';


Map<String, WidgetBuilder> routes = {
  '/': (context) => const AppRoot(title: 'Flutter Demo Home Page'),
  Routes.customPrint:(context) => const CustomPrintPage(),
  // '/cupertino_page':(context) => const CupertinoPage(),
};

abstract class Routes{
  Routes();

  static String home =  '/';

  static String cupertinoPage = '/cupertino_page';

  static String customPrint = '/cumtom_print';
}