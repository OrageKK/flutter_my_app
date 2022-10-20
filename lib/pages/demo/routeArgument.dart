import 'package:flutter/material.dart';

class RouteArgDemo extends StatelessWidget {
  final Map arguments;
  const RouteArgDemo({super.key,required this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('路由传参Demo'),
      ),
      body: Center(
        child: Text(arguments['text']),
      ),
    );
  }
}
