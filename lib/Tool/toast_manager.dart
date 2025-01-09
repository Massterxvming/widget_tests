
import 'dart:ui';

class ToastManager {
  ToastManager._();

  static ToastManager _instance = ToastManager._();

  static ToastManager get instance => _instance;

  VoidCallback? close;

}
ToastManager appToast = ToastManager.instance;