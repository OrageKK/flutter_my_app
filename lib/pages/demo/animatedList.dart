import 'dart:async';
import 'package:flutter/material.dart';

class AnimatedListDemo extends StatefulWidget {
  const AnimatedListDemo({super.key});

  @override
  State<AnimatedListDemo> createState() => _AnimatedListDemoState();
}

class _AnimatedListDemoState extends State<AnimatedListDemo> {
  final _globalKey = GlobalKey<AnimatedListState>();
  bool canDelete = true;
  List list = ['第一', '第二', '第三'];

  Widget _buildItem(BuildContext context, int index) {
    return ListTile(
      title: Text(list[index]),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          // 执行删除
          _deleteItem(index);
        },
      ),
    );
  }

  void _deleteItem(index) {
    if (list.length > index && canDelete) {
      // 解决过快点击删除的bug
      canDelete = false;
      _globalKey.currentState!.removeItem(index, (context, animation) {
        var item = _buildItem(context, index); // 获取要删除的元素
        list.removeAt(index);  // 删除元数据
        return ScaleTransition(
          scale: animation,
          child: item, // 执行动画的元素
        );
      });
      Timer.periodic(const Duration(milliseconds: 500), (timer) {
        canDelete = true;
        timer.cancel();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            list.add('增加的');
            _globalKey.currentState!.insertItem(list.length - 1,
                duration: const Duration(milliseconds: 500));
          });
        },
        child: const Icon(Icons.add),
      ),
      body: AnimatedList(
        key: _globalKey,
        initialItemCount: list.length,
        itemBuilder: (context, index, animation) {
          return FadeTransition(
              opacity: animation, child: _buildItem(context, index)); // 渐变组件
        },
      ),
    );
  }
}
