import 'package:flutter/material.dart';

/// 默认情况下， AnimationController 对象值的范围是[0.0，1.0]。如果我们需要构建UI的动画值在不同
/// 的范围或不同的数据类型，则可以使用 [Tween] 来添加映射以生成不同的范围或数据类型的值
///
class SlideTransitionDemo extends StatefulWidget {
  final Map arguments;
  const SlideTransitionDemo({super.key, required this.arguments});

  @override
  State<SlideTransitionDemo> createState() => _SlideTransitionDemoState();
}

class _SlideTransitionDemoState extends State<SlideTransitionDemo>
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
          setState(() {
            flag = !flag;
            // _controller.repeat();
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
          /// 这是一负责平移的显示动画组件，使用时需要通过position属性传入一个Animated表示位移程度，通常借助Tween实现。
          SlideTransition(
            // 1._controller.drive驱动动画
            // position: _controller.drive(Tween(
            //     begin: const Offset(0, 0),
            //     end: const Offset(1.2, 0) //表示实际的位置向右移动自身宽度的1.2倍
            //     )),

            // 2.Tween.animate 驱动
            // position: Tween(
            //         begin: const Offset(0, 0),
            //         end: const Offset(1.2, 0) //表示实际的位置向右移动自身宽度的1.2倍
            //         )
            //     .animate(_controller),

            // 3.链式操作修改动画效果
            // position: Tween(
            //         begin: const Offset(0, -1), //表示实际的位置向上移动自身高度的1倍
            //         end: const Offset(0, 0.8) //表示实际的位置向下移动自身高度的0.8倍
            //         )
            //     .chain(CurveTween(curve: Curves.bounceIn))
            //     .animate(_controller),

            // 3.链式操作修改动画时间
            position:
                Tween(begin: const Offset(0, -1), end: const Offset(0, 0.8))
                    .chain(CurveTween(curve: Curves.bounceIn))
                    .chain(CurveTween(
                        curve: const Interval(0.8, 1.0))) //最后的百分之20的时间完成动画
                    .animate(_controller),
            child: const FlutterLogo(
              size: 80,
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
