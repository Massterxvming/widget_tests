import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomCenter extends SingleChildRenderObjectWidget {
  final Widget child;

  const CustomCenter({super.key, required this.child}) : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
    throw UnimplementedError();
  }
}

class RenderCustomCenter extends RenderProxyBox {
  RenderCustomCenter({RenderBox? child}) : super(child);

  @override
  void performLayout() {
    child!.layout(BoxConstraints.loose(size), parentUsesSize: true);

    BoxParentData parentData = child!.parentData as BoxParentData;
    parentData.offset = ((size - child!.size) as Offset) / 2;
  }
}

class LeftRightBox extends MultiChildRenderObjectWidget {
  const LeftRightBox({
    super.key,
    required super.children,
  }):assert(children.length == 2, 'LeftRightBox must have exactly 2 children');

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomCenter();
  }
}
