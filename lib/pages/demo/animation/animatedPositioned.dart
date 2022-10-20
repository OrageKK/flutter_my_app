import 'package:flutter/material.dart';

class AnimatedPositionedDemo extends StatefulWidget {
  final Map arguments;
  const AnimatedPositionedDemo({super.key, required this.arguments});

  @override
  State<AnimatedPositionedDemo> createState() => _AnimatedPositionedDemoState();
}

class _AnimatedPositionedDemoState extends State<AnimatedPositionedDemo> {
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
        body: Stack(
          children: [
            AnimatedPositioned(
              top: flag ? 10 : 80,
              left: flag ? 10 : 90,
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 500),
              child: Container(
                color: Colors.red,
                width: 200,
                height: 200,
              ), // 动画执行时间
            ),
            ListView(
              children: const [
                ListTile(
                  title: Text('我是列表'),
                ),
                ListTile(
                  title: Text('我是列表'),
                ),
                ListTile(
                  title: Text('我是列表'),
                ),
                ListTile(
                  title: Text('我是列表'),
                ),
                ListTile(
                  title: Text('我是列表'),
                ),
                ListTile(
                  title: Text('我是列表'),
                ),
                ListTile(
                  title: Text('我是列表'),
                ),
                ListTile(
                  title: Text('我是列表'),
                ),
              ],
            ),
          ],
        ));
  }
}
