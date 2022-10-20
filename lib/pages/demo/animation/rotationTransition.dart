import 'package:flutter/material.dart';

class RotationTransitionDemo extends StatefulWidget {
  final Map arguments;
  const RotationTransitionDemo({super.key, required this.arguments});

  @override
  State<RotationTransitionDemo> createState() => _RotationTransitionDemoState();
}

class _RotationTransitionDemoState extends State<RotationTransitionDemo> with SingleTickerProviderStateMixin{
  bool flag = true;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, //Vsync 机制可以理解为是显卡与显示器的通信桥梁，显卡在渲染每一帧之前会等待垂直同步信号，
      // 只有显示器完成了一次刷新时，发出垂直同步信号，显卡才会渲染下一帧，确保刷新率和帧率保持同步，以达到供需平衡的效果，防止卡顿现象。

      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RotationTransition(
            turns: _controller,
            child: const FlutterLogo(
              size: 100,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Wrap(
              spacing: 10,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _controller.forward(); //正序播放一次
                    },
                    child: const Text("Forward")),
                ElevatedButton(
                    onPressed: () {
                      _controller.reverse(); //倒序播放一次
                    },
                    child: const Text("Reverse")),
                ElevatedButton(
                    onPressed: () {
                      _controller.stop(); //停止播放
                    },
                    child: const Text("Stop")),
                ElevatedButton(
                    onPressed: () {
                      _controller.reset(); //重置
                    },
                    child: const Text("rest")),
                ElevatedButton(
                    onPressed: () {
                      _controller.repeat(); //重复播放
                    },
                    child: const Text("repeat"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
