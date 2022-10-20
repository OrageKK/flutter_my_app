import 'package:flutter/material.dart';

class PageViewDemo extends StatelessWidget {
  const PageViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageViewDemo '),
      ),
      body: PageView(
        scrollDirection: Axis.vertical, // 更改方向
        children: [ // 每个子组件都是一屏
          Center(
            child: Text('第一屏',style: Theme.of(context).textTheme.headline1,),
          ),
          Center(
            child: Text('第二屏',style: Theme.of(context).textTheme.headline1,),
          ),
          Center(
            child: Text('第三屏',style: Theme.of(context).textTheme.headline1,),
          ),
        ],
      ),
    );
  }
}
