import 'package:flutter/cupertino.dart';
import 'package:widget_test/provider_test/provider_page/demo_data.dart';

class DemoProvider extends ChangeNotifier {
  final state = DemoData()..name='StateData';

  void updateName(String name) {
    state.name = name;
    notifyListeners();
  }
}