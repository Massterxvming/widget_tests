import 'package:flutter/material.dart';

class TabButton extends StatefulWidget {
  const TabButton({super.key});

  @override
  State<TabButton> createState() => _TabButtonState();
}

class _TabButtonState extends State<TabButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: const Column(
        children: [
          Icon(
            Icons.house_outlined,
            size: 28,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Home',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
