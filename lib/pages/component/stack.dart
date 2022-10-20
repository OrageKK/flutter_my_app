import 'package:flutter/material.dart';

class StackComponent extends StatelessWidget {
  const StackComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          color: Colors.red,
        ),
        Positioned(
          // 绝对定位
          bottom: 10,
          left: 20,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.cyan,
          ),
        ),
        const Positioned(
          right: 0,
          top: 95,
          child: Text("data"),
        ),
      ],
    );
  }
}
