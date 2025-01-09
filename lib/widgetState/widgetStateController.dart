import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Widgetstatecontroller extends StatefulWidget {
  const Widgetstatecontroller({super.key});

  @override
  State<Widgetstatecontroller> createState() => _WidgetstatecontrollerState();
}

class _WidgetstatecontrollerState extends State<Widgetstatecontroller> {
  final _controller = WidgetStatesController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _controller,
        builder: (context, states, _) {
          return Card(
            elevation: states.contains(WidgetState.pressed) ? 4 : 0,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text('text'),
                  TextButton(
                    statesController: _controller,
                    onPressed: () {},
                    child: const Text('Button'),
                  )
                ],
              ),
            ),
          );
        },
    );
  }
}
