import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimatedSwitcherDemo extends StatefulWidget {
  final Map arguments;
  const AnimatedSwitcherDemo({super.key, required this.arguments});

  @override
  State<AnimatedSwitcherDemo> createState() => _AnimatedSwitcherDemoState();
}

class _AnimatedSwitcherDemoState extends State<AnimatedSwitcherDemo> {
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
          width: double.infinity,
          height: 200,
          child: AnimatedSwitcher(
            // AnimatedSwitcher则是在子元素改变的 时候执行动画。
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
              // 此属性用来更改动画效果
              return ScaleTransition(
                // 显示动画-放大缩小
                scale: animation,
                // 显示动画-透明动画
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },
            // child: Text( // 同一个组件要用AnimatedSwitcher，需要加key
            //   key: UniqueKey(),
            //   flag ? '原来的' : '改变了',
            //   style: const TextStyle(fontSize: 30),
            // ),
            child: flag
                ? const CircularProgressIndicator()
                : CachedNetworkImage(
                    imageUrl:
                        'https://img1.baidu.com/it/u=2784709542,494352760&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500'),
          ),
        ),
      ),
    );
  }
}
