import 'dart:math';

import 'package:flutter/material.dart';

class CircleLayoutHXDemo extends StatefulWidget {
  final Map arguments;
  const CircleLayoutHXDemo({super.key, required this.arguments});

  @override
  State<CircleLayoutHXDemo> createState() => _CircleLayoutHXDemoState();
}

class _CircleLayoutHXDemoState extends State<CircleLayoutHXDemo>
    with SingleTickerProviderStateMixin {
  bool flag = true;
  final sides = [
    50.0,
    50.0,
    50.0,
    50.0,
    50.0,
  ];
  final colors = [
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.green,
    Colors.cyan,
  ];
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, //Vsync 机制可以理解为是显卡与显示器的通信桥梁，显卡在渲染每一帧之前会等待垂直同步信号，
      // 只有显示器完成了一次刷新时，发出垂直同步信号，显卡才会渲染下一帧，确保刷新率和帧率保持同步，以达到供需平衡的效果，防止卡顿现象。

      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildItem(MapEntry<int, double> e) {
    return ScaleTransition(
      scale: Tween(begin: 1.0, end: 1 + Random().nextDouble())
          .chain(CurveTween(curve: Curves.linear))
          .chain(CurveTween(curve: Interval(0, (e.key % 2) == 2 ? 0.5 : 1)))
          .animate(_controller),
      child: ClipOval(
        child: Container(
          width: e.value,
          alignment: Alignment.center,
          height: e.value,
          color: colors[e.key],
          child: Text('${e.value}'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: 'ianim',
        child: const Icon(Icons.leak_add),
        onPressed: () {
          setState(() {
            flag ? _controller.forward() : _controller.reverse();
            flag = !flag;
          });
        },
      ),
      appBar: AppBar(
        title: Text(widget.arguments['title']),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.grey.withAlpha(66),
          alignment: Alignment.center,
          child: CircleFlow(
            children: sides.asMap().entries.map((e) => _buildItem(e)).toList(),
          ),
        ),
      ),
    );
  }
}

class CircleFlow extends StatefulWidget {
  final List<Widget> children;
  const CircleFlow({super.key, required this.children});

  @override
  State<CircleFlow> createState() => _CircleFlowState();
}

class _CircleFlowState extends State<CircleFlow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double rad = 0.0;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this)
      ..addListener(() => setState(() => rad = _controller.value * pi * 2));
    // _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: _CircleDelegate(rad),
      children: widget.children,
    );
  }
}

// 圆形分布
class _CircleDelegate extends FlowDelegate {
  final double rad;
  _CircleDelegate(this.rad);

  @override
  void paintChildren(FlowPaintingContext context) {
    // 半径
    double radius = context.size.shortestSide / 2;
    var count = context.childCount;
    // 角度
    var perRad = 2 * pi / count;
    for (int i = 0; i < count; i++) {
      // 宽中心点
      var cSizeX = context.getChildSize(i)!.width / 2;
      // 高中心点
      var cSizeY = context.getChildSize(i)!.height / 2;
      var offsetX = (radius - cSizeX) * cos(i * perRad) + radius;
      var offsetY = (radius - cSizeY) * sin(i * perRad) + radius;
      context.paintChild(i,
          transform: Matrix4.translationValues(
              offsetX - cSizeX, offsetY - cSizeY, 0.0));
      // var offsetX = cos(i * perRad) * radius - cSizeX + radius;
      // var offsetY = sin(i * perRad) * radius - cSizeY + radius;
      // context.paintChild(i,
      //     transform: Matrix4.translationValues(offsetX, offsetY, 0.0));
      // print("i:$i，offsetX：$offsetX");

      /**
       *  标准矩形内切圆算法，中心点位于圆环上，会溢出父容器
       *  三角函数算出X,Y坐标，减去子widget的中心点+半径，这是为了让组件的中心在圆弧上同时将坐标原点移动到画布中心
       *  var offsetX = cos(i * perRad) * radius - cSizeX + radius;
       *  var offsetY = sin(i * perRad) * radius - cSizeY + radius;
       *  context.paintChild(i,
       *  transform: Matrix4.translationValues(offsetX, offsetY, 0.0));
      */
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return true;
  }
}
