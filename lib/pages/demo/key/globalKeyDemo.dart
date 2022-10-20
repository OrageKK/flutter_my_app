import 'package:flutter/material.dart';

/// 竖屏返回colum，横屏返回row，屏幕旋转状态丢失，局部key失效
/// 全局key的演示

class GlobalKeyDemo extends StatefulWidget {
  const GlobalKeyDemo({super.key});

  @override
  State<GlobalKeyDemo> createState() => _GlobalKeyDemoState();
}

class _GlobalKeyDemoState extends State<GlobalKeyDemo> {
  // 局部键(LocalKey):ValueKey、ObjectKey、UniqueKey

  /// 全局键(GlobalKey): GlobalKey、GlobalObjectKey
  final GlobalKey _gKey1 = GlobalKey();
  final GlobalKey _gKey2 = GlobalKey();
  final GlobalKey _gKey3 = const GlobalObjectKey('9898');

  List<Widget> list = [];

  @override
  void initState() {
    super.initState();
    list = [
      Box(key: _gKey1, color: Colors.red),
      Box(key: _gKey2, color: Colors.yellow),
      Box(key: _gKey3, color: Colors.blue),
    ];
  }

  @override
  Widget build(BuildContext context) {
    /// 设备方向
    Orientation direction = MediaQuery.of(context).orientation;

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
        title: const Text('globalkey基本演示'),
      ),
      body: Center(
        /// 竖屏返回colum，横屏返回row，屏幕旋转状态丢失，局部key失效
        child: direction == Orientation.portrait
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list,
              )
            : Row(
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
