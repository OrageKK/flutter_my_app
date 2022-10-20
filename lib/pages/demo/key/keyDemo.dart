import 'package:flutter/material.dart';

class KeyBasicDemo extends StatefulWidget {
  const KeyBasicDemo({super.key});

  @override
  State<KeyBasicDemo> createState() => _KeyBasicDemoState();
}

class _KeyBasicDemoState extends State<KeyBasicDemo> {
  /// 局部键(LocalKey):ValueKey、ObjectKey、UniqueKey
  /// 全局键(GlobalKey): GlobalKey、GlobalObjectKey
  List<Widget> list = [
    const Box(key: ValueKey('value'), color: Colors.red),
    Box(key: UniqueKey(), color: Colors.yellow),
    const Box(key: ObjectKey(Text('可以是任意对象')), color: Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            list.shuffle(); // 随机打乱顺序
          });
        },
        child: const Icon(Icons.refresh),
      ),
      appBar: AppBar(
        title: const Text('key基本演示'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: list,
        ),
      ),
    );
  }
}

class Box extends StatefulWidget {
  final Color color;

  const Box({super.key, required this.color});
  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(widget.color)),
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        child: Center(
          child: Text("$_count"),
        ),
      ),
    );
  }
}
