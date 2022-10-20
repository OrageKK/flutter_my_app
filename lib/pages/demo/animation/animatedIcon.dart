import 'package:flutter/material.dart';

/// AnimatedIcon顾名思义，是一个用于提供动画图标的组件，它的名字虽然是以Animated开头，但是他
/// 是一个显式动画组件，需要通过progress属性传入动画控制器，另外需要由Icon属性传入动画图标数据
class AnimatedIconDemo extends StatefulWidget {
  final Map arguments;
  const AnimatedIconDemo({super.key, required this.arguments});

  @override
  State<AnimatedIconDemo> createState() => _AnimatedIconDemoState();
}

class _AnimatedIconDemoState extends State<AnimatedIconDemo>
    with SingleTickerProviderStateMixin {
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
          flag?_controller.forward():_controller.reverse();
          flag = !flag;
        },
      ),
      appBar: AppBar(
        title: Text(widget.arguments['title']),
      ),
      body: Center(
        child: AnimatedIcon(
            icon: AnimatedIcons.menu_close, progress: _controller, size: 40),
      ),
    );
  }
}
