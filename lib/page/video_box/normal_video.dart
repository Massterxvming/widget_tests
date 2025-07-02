import 'package:flutter/cupertino.dart';
import 'package:widget_test/page/empty_box/normal_empty.dart';

class NormalVideoBox extends StatefulWidget {
  const NormalVideoBox({super.key});

  @override
  State<NormalVideoBox> createState() => _NormalVideoBoxState();
}

class _NormalVideoBoxState extends State<NormalVideoBox> {
  @override
  Widget build(BuildContext context) {
    return const NormalEmpty();
  }
}
