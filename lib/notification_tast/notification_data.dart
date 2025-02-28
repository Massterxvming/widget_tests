import 'package:flutter/cupertino.dart';

class NotificationData extends Notification{
  final String data;

  NotificationData({this.data = 'OriginalData'});

  NotificationData copy(){
    return NotificationData();
  }
  
}