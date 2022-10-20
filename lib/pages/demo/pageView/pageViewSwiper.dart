import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../model/post.dart';

class PageViewSwiperDemo extends StatefulWidget {
  const PageViewSwiperDemo({super.key});

  @override
  State<PageViewSwiperDemo> createState() => _PageViewSwiperDemoState();
}

class _PageViewSwiperDemoState extends State<PageViewSwiperDemo>
    with SingleTickerProviderStateMixin {
  late List<Widget> list = [];
  List data = posts.take(5).toList();
  int _currentIndex = 0;

  final PageController _pageController =
      PageController(initialPage: 1); // 因为有增补从1开始
  late TabController _tabController;
  late Timer _timer;

  //取出前面多少个元素放在新的list中
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: data.length, vsync: this);
    _timer = Timer.periodic(const Duration(milliseconds: 1500), _timerChage);

    for (var post in data) {
      list.add(
        CachedNetworkImage(
          imageUrl: post.imageUrl,
          fit: BoxFit.cover,
        ),
      );
    }
    // 通过给头添加3 尾添加1来实现轮播
    if (data.length > 1) {
      // 头部添加末尾的图片
      list.insert(
        0,
        CachedNetworkImage(
          imageUrl: data[data.length - 1].imageUrl,
          fit: BoxFit.cover,
        ),
      );
      // 尾部添加头部图片
      list.add(
        CachedNetworkImage(
          imageUrl: data[0].imageUrl,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _onPageChange(index) {
    // 控制pageControl
    if (data.length == 1) {
      return;
    }
    if (index == 0) {
      // 0是插入的3，手动到1 轮播到第一张后跳到倒数第二张
      _tabController.animateTo(_tabController.length - 1);
      _pageController.jumpToPage(data.length);
      _currentIndex = data.length;
    } else if (index == data.length + 1) {
      // 当索引==图片数量+1，时  2 012 0
      // 轮播到最后一张后跳到第二张
      _tabController.animateTo(0);
      _pageController.jumpToPage(1);
      _currentIndex = 1;
    } else {
      _tabController.animateTo(index - 1);
      _currentIndex = index;
    }
  }

  void _timerChage(Timer timer) {
    if (data.length > 1) {
      _currentIndex++;
      _pageController.animateToPage(_currentIndex % data.length,
          duration: const Duration(microseconds: 20), curve: Curves.fastOutSlowIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('轮播demo'),
      ),
      body: Container(
        width: double.infinity,
        height: 200,
        color: Colors.red,
        // padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: true, // 缓存当前页面的前后两页
              onPageChanged: _onPageChange,
              children: list,
            ),
            Align(
              alignment: const Alignment(0.0, 0.95),
              child: TabPageSelector(
                color: Colors.white,
                selectedColor: Colors.red,
                controller: _tabController,
              ),
            )
          ],
        ),
      ),
    );
  }
}
