import 'package:flutter/material.dart';

class AnimatedOpacityDemo extends StatefulWidget {
  final Map arguments;
  const AnimatedOpacityDemo({super.key, required this.arguments});

  @override
  State<AnimatedOpacityDemo> createState() => _AnimatedOpacityDemoState();
}

class _AnimatedOpacityDemoState extends State<AnimatedOpacityDemo> {
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
          child: AnimatedOpacity(
            opacity: flag?0.3:1,
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 500),
            child: Container(
              color: Colors.red,
              width: 200,
              height: 200,
            ), // 动画执行时间
          ),
        ));
  }
}
