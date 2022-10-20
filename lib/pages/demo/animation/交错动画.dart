import 'package:flutter/material.dart';

/// AnimatedIcon顾名思义，是一个用于提供动画图标的组件，它的名字虽然是以Animated开头，但是他
/// 是一个显式动画组件，需要通过progress属性传入动画控制器，另外需要由Icon属性传入动画图标数据
class StaggeredAnimatedDemo extends StatefulWidget {
  final Map arguments;
  const StaggeredAnimatedDemo({super.key, required this.arguments});

  @override
  State<StaggeredAnimatedDemo> createState() => _StaggeredAnimatedDemoState();
}

class _StaggeredAnimatedDemoState extends State<StaggeredAnimatedDemo>
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
          flag ? _controller.forward() : _controller.reverse();
          flag = !flag;
        },
      ),
      appBar: AppBar(
        title: Text(widget.arguments['title']),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SlidingBox(
            controller: _controller,
            color: Colors.blue[200],
            curve: const Interval(0, 0.2),
          ),
          SlidingBox(
            controller: _controller,
            color: Colors.blue[400],
            curve: const Interval(0.2, 0.4),
          ),
          SlidingBox(
            controller: _controller,
            color: Colors.blue[600],
            curve: const Interval(0.4, 0.6),
          ),
          SlidingBox(
            controller: _controller,
            color: Colors.blue[800],
            curve: const Interval(0.6, 0.8),
          ),
          SlidingBox(
            controller: _controller,
            color: Colors.blue[900],
            curve: const Interval(0.8, 1.0),
          ),
        ],
      ),
    );
  }
}

class SlidingBox extends StatelessWidget {
  final AnimationController controller;
  final Color? color;
  final Curve curve;
  const SlidingBox(
      {super.key,
      required this.controller,
      required this.color,
      required this.curve});
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween(begin: const Offset(0, 0), end: const Offset(0.3, 0))
          .chain(CurveTween(curve: Curves.bounceInOut))
          .chain(CurveTween(curve: curve))
          .animate(controller),
      child: Container(
        width: 220,
        height: 60,
        color: color,
      ),
    );
  }
}
