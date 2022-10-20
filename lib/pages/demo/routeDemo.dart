import 'package:flutter/material.dart';
import 'package:my_app/pages/component/wrap.dart';

class RouteDemo extends StatelessWidget {
  const RouteDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () => {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const WrapDemo(); // 基本路由跳转
            }))
          },
          icon: const Icon(
            Icons.login,
          ),
          label: const Text('基本路由跳转'),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(const Color(0xff3480ff)), // 背景颜色
            foregroundColor:
                MaterialStateProperty.all(Colors.white), // 文字或图标对应的颜色
            textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                // 圆角
                borderRadius: BorderRadius.circular(10))),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () => {
            Navigator.pushNamed(context, '/rArg',
                arguments: {'text': '命名路由传值-1'}) // 命名路由跳转传值
          },
          icon: const Icon(
            Icons.login,
          ),
          label: const Text('命名路由跳转'),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(const Color(0xff3480ff)), // 背景颜色
            foregroundColor:
                MaterialStateProperty.all(Colors.white), // 文字或图标对应的颜色
            textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                // 圆角
                borderRadius: BorderRadius.circular(10))),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () => Navigator.pushNamed(context, '/first'), // 替换路由跳转
          icon: const Icon(
            Icons.app_registration,
          ),
          label: const Text('替换路由演示'),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(const Color(0xff3480ff)), // 背景颜色
            foregroundColor:
                MaterialStateProperty.all(Colors.white), // 文字或图标对应的颜色
            textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                // 圆角
                borderRadius: BorderRadius.circular(10))),
          ),
        ),
      ],
    );
  }
}
