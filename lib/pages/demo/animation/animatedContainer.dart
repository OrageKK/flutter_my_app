import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  final Map arguments;
  const AnimatedContainerDemo({super.key, required this.arguments});

  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
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
        body: Center(
          child: AnimatedContainer(
            width: flag ? 200 : 300,
            height: flag ? 200 : 300,
            color: Colors.blue,
            transform: flag
                ? Matrix4.translationValues(0, 0, 0)
                : Matrix4.translationValues(0, 100, 30),
            duration: const Duration(milliseconds: 300), // 动画执行时间
          ),
        ));
  }
}
