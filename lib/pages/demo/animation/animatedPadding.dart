import 'package:flutter/material.dart';

class AnimatedPaddingDemo extends StatefulWidget {
  final Map arguments;
  const AnimatedPaddingDemo({super.key, required this.arguments});

  @override
  State<AnimatedPaddingDemo> createState() => _AnimatedPaddingDemoState();
}

class _AnimatedPaddingDemoState extends State<AnimatedPaddingDemo> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: 'ianim',
        child: const Icon(Icons.leak_add),
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
      ),
      appBar: AppBar(
        title: Text(widget.arguments['title']),
      ),
      body: AnimatedPadding(
        curve: Curves.bounceInOut, // 配置动画过程(效果)
        padding: EdgeInsets.fromLTRB(10, flag ? 10 : 350, 0, 0),
        duration: const Duration(milliseconds: 1500), // 动画执行时间
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
      ),
    );
  }
}
