import 'package:flutter/material.dart';

class StackList extends StatelessWidget {
  const StackList({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // 浮动内容
      children: [
        ListView(
          padding: const EdgeInsets.only(top: 50),
          children: const [
            ListTile(
              title: Text("我是一个列表1"),
            ),
            ListTile(
              title: Text("我是一个列表1"),
            ),
            ListTile(
              title: Text("我是一个列表1"),
            ),
            ListTile(
              title: Text("我是一个列表1"),
            ),
            ListTile(
              title: Text("我是一个列表1"),
            ),
            ListTile(
              title: Text("我是一个列表1"),
            ),
            ListTile(
              title: Text("我是一个列表1"),
            ),
            ListTile(
              title: Text("我是一个列表1"),
            ),
            ListTile(
              title: Text("我是一个列表1"),
            ),
            ListTile(
              title: Text("我是一个列表1"),
            ),
            ListTile(
              title: Text("我是一个列表1"),
            ),
            ListTile(
              title: Text("我是一个列表1"),
            ),
            ListTile(
              title: Text("我是一个列表1"),
            ),
          ],
        ),
        Positioned(
          left: 0,
          top: 0,
          width: MediaQuery.of(context).size.width, // 配置子组件的宽度高度
          height: 44,
          child: Container(
            alignment: Alignment.center,
            height: 44,
            color: Colors.red,
            child: const Text(
              "二级导航",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
