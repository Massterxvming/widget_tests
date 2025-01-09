import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Outlinedbutton extends StatefulWidget {
  const Outlinedbutton({super.key});

  @override
  State<Outlinedbutton> createState() => _OutlinedButtonState();
}

class _OutlinedButtonState extends State<Outlinedbutton> {
  final WidgetStatesController states = WidgetStatesController();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Text('OutlinedButton'),
      style: OutlinedButton.styleFrom(
      ).copyWith(
          shape: WidgetStateProperty.resolveWith((callback) {
        if(callback.contains(WidgetState.pressed)){
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          );
        }
        if(callback.contains(WidgetState.values)){
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          );
        }
        return null;
      }),
        side: WidgetStateProperty.resolveWith((callback) {
          if(callback.contains(WidgetState.pressed)){
            return BorderSide(color: Colors.red);
          }
          if(callback.contains(WidgetState.values)){
            return BorderSide(color: Colors.black);
          }
          if(callback.contains(WidgetState.selected)){
            return BorderSide(color: Colors.blueAccent);
          }
          return null;
        }),
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
      ),
    );
  }
}
