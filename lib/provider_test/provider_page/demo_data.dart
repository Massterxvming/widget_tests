class DemoData {
  String name;

  DemoData({this.name = 'OriginData'});

  DemoData copy(){
    return DemoData()..name = name;
  }
}

