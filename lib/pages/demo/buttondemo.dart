import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  void _buttonClick() {
    debugPrint('普通按钮');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // 按钮种类
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: _buttonClick,
              child: const Text('普通按钮'),
            ),
            TextButton(
                onPressed: () => {debugPrint('文本按钮')},
                child: const Text('文本按钮')),
            OutlinedButton(
                onPressed: () => {debugPrint('边框按钮')},
                child: const Text('边框按钮')),
            IconButton(
                onPressed: () => {debugPrint('icon按钮')},
                icon: const Icon(Icons.safety_check)),
          ],
        ),
        Row(
          // icon 按钮
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: () => {debugPrint('icon按钮')},
              icon: const Icon(Icons.send),
              label: const Text('发送'),
            ),
            TextButton.icon(
              onPressed: () => {debugPrint('icon按钮')},
              icon: const Icon(Icons.email),
              label: const Text('email'),
            ),
            OutlinedButton.icon(
              onPressed: () => {debugPrint('icon按钮')},
              icon: const Icon(Icons.phone),
              label: const Text('phone'),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          // 更改样式
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              // 配置按钮宽度高度，外层加sizebox指定宽高
              height: 44,
              width: 100,
              child: ElevatedButton.icon(
                onPressed: () => {debugPrint('icon按钮')},
                icon: const Icon(
                  Icons.send,
                ),
                label: const Text('发送'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color(0xff3480ff)), // 背景颜色
                  foregroundColor:
                      MaterialStateProperty.all(Colors.white), // 文字或图标对应的颜色
                  textStyle:
                      MaterialStateProperty.all(const TextStyle(fontSize: 20)),
                ),
              ),
            ),
          ],
        ),
        Row(
          // 自适应按钮 & 圆角按钮
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                height: 70,
                child: ElevatedButton.icon(
                  onPressed: () => {debugPrint('icon按钮')},
                  icon: const Icon(
                    Icons.login,
                  ),
                  label: const Text('登录'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color(0xff3480ff)), // 背景颜色
                    foregroundColor:
                        MaterialStateProperty.all(Colors.white), // 文字或图标对应的颜色
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 20)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        // 圆角
                        borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          // 圆形按钮
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                height: 100,
                width: 100,
                child: ElevatedButton.icon(
                  onPressed: () => {debugPrint('icon按钮')},
                  icon: const Icon(
                    Icons.login,
                  ),
                  label: const Text('登录'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color(0xff3480ff)), // 背景颜色
                    foregroundColor:
                        MaterialStateProperty.all(Colors.white), // 文字或图标对应的颜色
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 20)),
                    shape: MaterialStateProperty.all(// 圆形按钮
                        const CircleBorder(
                            side: BorderSide(color: Colors.black))),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          // 边框修改
          children: [
            OutlinedButton.icon(
              onPressed: () => {debugPrint('icon按钮')},
              icon: const Icon(Icons.phone),
              label: const Text('phone'),
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    const BorderSide(color: Colors.red, width: 1)),
                foregroundColor: MaterialStateProperty.all(Colors.blue),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
