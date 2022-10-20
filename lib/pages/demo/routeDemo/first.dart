import 'package:flutter/material.dart';

class RouteFirstDemo extends StatelessWidget {
  const RouteFirstDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('路由替换1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('这是第一步'),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/second'),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xff3480ff)), // 背景颜色
                foregroundColor:
                    MaterialStateProperty.all(Colors.white), // 文字或图标对应的颜色
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 20)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    // 圆角
                    borderRadius: BorderRadius.circular(10))),
              ),
              child: const Text('下一步'),
            )
          ],
        ),
      ),
    );
  }
}
