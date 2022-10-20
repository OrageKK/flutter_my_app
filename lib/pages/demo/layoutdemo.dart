import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // 需求：显示一个容器，宽度是屏幕宽度，高度是宽度一半
    return Container(
      color: Colors.blue,
      child: Center(
        child: AspectRatio(
          aspectRatio: 2 / 1, // 配置宽高比
          child: Container(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
