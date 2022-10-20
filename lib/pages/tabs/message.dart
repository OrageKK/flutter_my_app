import 'package:flutter/material.dart';
import 'package:my_app/pages/demo/pageView/pageView.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () => {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const PageViewDemo();
              }))
            },
            icon: const Icon(
              Icons.login,
            ),
            label: const Text('pageView'),
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
          ),
          ElevatedButton.icon(
            onPressed: () => {
              Navigator.pushNamed(
                context,
                '/pageViewB',
              )
            },
            icon: const Icon(
              Icons.login,
            ),
            label: const Text('pageViewBuilder'),
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
          ),
          ElevatedButton.icon(
            onPressed: () =>
                Navigator.pushNamed(context, '/pageViewF'), // 替换路由跳转
            icon: const Icon(
              Icons.app_registration,
            ),
            label: const Text('无限PageVIew'),
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
          ),
          ElevatedButton.icon(
            onPressed: () =>
                Navigator.pushNamed(context, '/pageViewS'), // 替换路由跳转
            icon: const Icon(
              Icons.app_registration,
            ),
            label: const Text('轮播swiper'),
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
          ),
          ElevatedButton.icon(
            onPressed: () =>
                Navigator.pushNamed(context, '/keyBasicDemo'), // 替换路由跳转
            icon: const Icon(
              Icons.app_registration,
            ),
            label: const Text('keyBasicDemo'),
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
          ),
          ElevatedButton.icon(
            onPressed: () =>
                Navigator.pushNamed(context, '/globalKeyDemo'), // 替换路由跳转
            icon: const Icon(
              Icons.app_registration,
            ),
            label: const Text('GlobalKeyDemo'),
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
          ),
          ElevatedButton.icon(
            onPressed: () =>
                Navigator.pushNamed(context, '/globalKeyUse'), // 替换路由跳转
            icon: const Icon(
              Icons.app_registration,
            ),
            label: const Text('globalKeyUse'),
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
          ),
          ElevatedButton.icon(
            onPressed: () =>
                Navigator.pushNamed(context, '/sliverDemo'), // 替换路由跳转
            icon: const Icon(
              Icons.app_registration,
            ),
            label: const Text('sliverDemo'),
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
          ),
          ElevatedButton.icon(
            onPressed: () =>
                Navigator.pushNamed(context, '/persistentHeader'), // 替换路由跳转
            icon: const Icon(
              Icons.app_registration,
            ),
            label: const Text('persistentHeader'),
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
          ),
        ],
      ),
    );
  }
}
