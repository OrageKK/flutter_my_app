import 'package:flutter/material.dart';

class PageViewFullDemo extends StatefulWidget {
  const PageViewFullDemo({super.key});

  @override
  State<PageViewFullDemo> createState() => _PageViewFullDemoState();
}

class _PageViewFullDemoState extends State<PageViewFullDemo> {
  late List<Widget> list = [];
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 10; i++) {
      list.add(
        Center(
          child: Text(
            '第${i + 1}屏',
            style: const TextStyle(fontSize: 100),
          ),
        ),
      );
    }
  }

  _onPageChange(index) {
    if (index + 2 == list.length) {
      // 第8屏增加数据
      setState(() {
        for (var i = 0; i < 10; i++) {
          list.add(
            Center(
              child: Text(
                '第${index+3+i}屏',
                style: const TextStyle(fontSize: 100),
              ),
            ),
          );
        }
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('无限PageView'),
      ),
      body: PageView(
        scrollDirection: Axis.vertical,
        allowImplicitScrolling: true, // 缓存当前页面的前后两页
        onPageChanged: _onPageChange,
        children: list,
      ),
    );
  }
}
