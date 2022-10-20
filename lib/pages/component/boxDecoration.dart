import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            // color: const Color(0xFFb9dec9),
            margin: const EdgeInsets.all(30.0),
            width: 200,
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFb9dec9),
              border: Border.all(color: Colors.black12, width: 2.0),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, offset: Offset(5, 5), blurRadius: 5)
              ],
              gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.green, Colors.yellow]),
              // backgroundBlendMode: BlendMode.color
            ),
            child: const Text(
              "你好okso",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        Container(
          height: 40,
          width: 150,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFF3480ff),
            borderRadius: BorderRadius.circular(15),
          ),
          // transform: Matrix4.rotationZ(3),// 旋转
          // transform:Matrix4.translationValues(50, 120, 0),// 位移
          child: const Text(
            "确定",
            style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w200),
            // textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}