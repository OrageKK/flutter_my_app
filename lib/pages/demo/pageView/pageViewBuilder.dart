import 'package:flutter/material.dart';
import 'package:my_app/tools/keepAliveWrapper.dart';

class PageViewBuilderDemo extends StatefulWidget {
  const PageViewBuilderDemo({super.key});

  @override
  State<PageViewBuilderDemo> createState() => _PageViewBuilderDemoState();
}

class _PageViewBuilderDemoState extends State<PageViewBuilderDemo> {
  Widget _itemBuilder(context, index) {
    return KeepAliveWrapper(child: PageViewItem(index: index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageViewBuilderDemo'),
      ),
      body: PageView.builder(
        itemCount: 10,
        itemBuilder: _itemBuilder,
        scrollDirection: Axis.vertical,
        // allowImplicitScrolling: true, // 缓存当前页面的前后两页
        // padEnds: false,
        // controller: PageController(viewportFraction: 0.5),
      ),
    );
  }
}

class PageViewItem extends StatelessWidget {
  final int index;
  const PageViewItem({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    print('调用了item的build');
    return Center(
      child: Text(
        '第${index + 1}屏',
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}