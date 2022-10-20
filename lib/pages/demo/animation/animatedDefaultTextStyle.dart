import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleDemo extends StatefulWidget {
  final Map arguments;
  const AnimatedDefaultTextStyleDemo({super.key, required this.arguments});

  @override
  State<AnimatedDefaultTextStyleDemo> createState() =>
      _AnimatedDefaultTextStyleDemoState();
}

class _AnimatedDefaultTextStyleDemoState
    extends State<AnimatedDefaultTextStyleDemo> {
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
        child: Container(
          alignment: Alignment.center,
          color: Colors.red,
          width: 200,
          height: 200,
          child: AnimatedDefaultTextStyle(
            curve: Curves.easeInToLinear,
            style: TextStyle(
                fontSize: flag ? 20 : 25,
                color: flag ? Colors.black : Colors.purple),
            duration: const Duration(milliseconds: 500),
            child: const Text(
              '你好flutter',
            ),
          ),
        ),
      ),
    );
  }
}
