import 'package:flutter/material.dart';
import '../../myHomePage.dart';

class RouteThirdDemo extends StatelessWidget {
  const RouteThirdDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('路由替换3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('这是第三步'),
            ElevatedButton(
              onPressed: () { // 返回根路由 
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (BuildContext context) {
                  return const MyHomePage();
                }), (route) => false);
              },
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
              child: const Text('完成'),
            )
          ],
        ),
      ),
    );
  }
}
