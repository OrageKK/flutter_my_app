import 'package:flutter/material.dart';

/// globalKey.currentState globalKey.currentWidget可以获取子组件的属性，
/// _globalKey.currentContext!.findRenderObject()可以获取渲染的属性。

class GlobalKeyUseDemo extends StatefulWidget {
  const GlobalKeyUseDemo({super.key});

  @override
  State<GlobalKeyUseDemo> createState() => _GlobalKeyUseDemoState();
}

class _GlobalKeyUseDemoState extends State<GlobalKeyUseDemo> {
  // 局部键(LocalKey):ValueKey、ObjectKey、UniqueKey

  /// 全局键(GlobalKey): GlobalKey、GlobalObjectKey
  final GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 获取子组件状态
          var state = _globalKey.currentState as _BoxState;
          setState(() {
            // 修改子组件的属性
            state._count++;
            // 调用子组件的方法
            state.run();
          });
          // 获取子组件属性
          var box = _globalKey.currentWidget as Box;
          print(box.color);
          // 获取子组件渲染的属性
          var renderBox =
              (_globalKey.currentContext!.findRenderObject() as RenderBox);
          print(renderBox.size);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('gloablKey作用'),
      ),
      body: Center(
        child: Box(key: _globalKey, color: Colors.red),
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
  void run(){
    print('我是子widget的run方法');
  }
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
