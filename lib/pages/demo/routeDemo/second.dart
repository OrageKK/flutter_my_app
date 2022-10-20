import 'package:flutter/material.dart';

class RouteSecondDemo extends StatelessWidget {
  const RouteSecondDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('路由替换2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('这是第二步'),
            ElevatedButton(
              // 替换跳转，在跳转前使用，下一页返回会直接略过本页 1-2(使用替换路由)-3 返回 3-1
              onPressed: () => Navigator.of(context).pushReplacementNamed('/third'),
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
