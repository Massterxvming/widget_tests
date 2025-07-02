

import 'package:flutter/cupertino.dart';

abstract class StateBase<T extends StatefulWidget> extends State<T>
{

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}
abstract class PageBase <T extends StatefulWidget> extends StateBase<T> {


}
