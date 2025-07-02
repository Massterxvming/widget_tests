import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

abstract class ControllerBase extends GetxController {

  Rx<bool> pageNeedRebuild = Rx(false);

  Rx<ThemeMode> themeModeRx = Rx(ThemeMode.system);
}