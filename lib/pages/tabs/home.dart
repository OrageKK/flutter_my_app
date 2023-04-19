import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/pages/component/expanded.dart';
import 'package:my_app/pages/demo/animatedList.dart';
import 'package:my_app/pages/demo/bulletComment.dart';
import 'package:my_app/pages/demo/buttondemo.dart';
import 'package:my_app/pages/demo/dialog.dart';
import 'package:my_app/pages/demo/homeList.dart';
import 'package:my_app/pages/demo/layoutdemo.dart';
import 'package:my_app/pages/demo/routeDemo.dart';
import 'package:my_app/pages/demo/stackList.dart';
import 'package:my_app/tools/keepAliveWrapper.dart';
import '../component/Align.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> _tabText = const [
    Tab(text: '列表'),
    Tab(text: '动画列表'),
    Tab(text: '按钮'),
    Tab(text: '路由'),
    Tab(text: '弹窗'),
    Tab(text: '布局'),
    Tab(text: 'Stack'),
    Tab(text: 'Align'),
    Tab(text: 'Expand'),
    Tab(text: '滚动弹幕'),
  ];

  final List<Widget> _tabView = const [
    KeepAliveWrapper(child: HomeListPage()),
    KeepAliveWrapper(child: AnimatedListDemo()),
    KeepAliveWrapper(child: ButtonDemo()),
    KeepAliveWrapper(child: RouteDemo()),
    KeepAliveWrapper(child: DialogDemo()),
    KeepAliveWrapper(child: LayoutDemo()),
    KeepAliveWrapper(child: StackList()),
    KeepAliveWrapper(child: AlignP()),
    KeepAliveWrapper(child: ExpandedComponent()),
    KeepAliveWrapper(child: BulletComment()),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabView.length, vsync: this);
    // 监听_tabController->index
    _tabController.addListener(() {
      if (_tabController.animation!.value == _tabController.index) {
        if (kDebugMode) {
          print(_tabController.index);
        } // 获取两次
      }
    });
  }

  @override
  void dispose() {
    // 页面销毁声明周期
    super.dispose();
    print('home销毁了');
    _tabController.dispose();
  }

  /**
   * 使用onTap获取index,只能获取点击的
   */

  void tabBarOnTap(int index) {
    print('onTap获取index==$index');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        // 通过 PreferredSize 控制appBar高度
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 250, 250, 250),
          elevation: 1.0, // 底部阴影
          title: SizedBox(
            height: 30, // 更改TabBar高度
            child: TabBar(
              onTap: tabBarOnTap,
              isScrollable: true,
              tabs: _tabText,
              controller: _tabController,
              indicatorColor: Colors.red, // 底部指示器颜色
              labelColor: Colors.red, // 文字颜色
              unselectedLabelColor: Colors.black87,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.normal),
              indicatorSize:
                  TabBarIndicatorSize.label, // label 和文字同宽 tab 和tab同宽
            ),
          ),
        ),
      ),
      body: TabBarView(controller: _tabController, children: _tabView),
      // body: LayoutDemo(),
    );
  }
}
