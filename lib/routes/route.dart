import 'package:flutter/material.dart';
import 'package:my_app/model/animated.dart';
// import 'package:flutter/cupertino.dart';  CupertinoPageRoute 配置iOS风格路由切换效果，替换MaterialPageRoute即可
import 'package:my_app/pages/component/wrap.dart';
import 'package:my_app/pages/demo/animation/animatedContainer.dart';
import 'package:my_app/pages/demo/dialog.dart';
import 'package:my_app/pages/demo/key/globalKeyDemo.dart';
import 'package:my_app/pages/demo/key/globalKeyUse.dart';
import 'package:my_app/pages/demo/key/keyDemo.dart';
import 'package:my_app/pages/demo/pageView/pageView.dart';
import 'package:my_app/pages/demo/pageView/pageViewBuilder.dart';
import 'package:my_app/pages/demo/pageView/pageViewFull.dart';
import 'package:my_app/pages/demo/pageView/pageViewSwiper.dart';
import 'package:my_app/pages/demo/routeDemo/first.dart';
import 'package:my_app/pages/demo/routeDemo/second.dart';
import 'package:my_app/pages/demo/routeDemo/third.dart';
import 'package:my_app/pages/demo/sliver/sliverDemo.dart';
import 'package:my_app/pages/myHomePage.dart';
import '../pages/demo/routeArgument.dart';
import '../pages/demo/sliver/persistentHeader.dart';

final Map<String, Function> routes = {
  '/': (contxt) => const MyHomePage(),
  '/wrap': (contxt) => const WrapDemo(),
  '/rArg': (context, {arguments}) => RouteArgDemo(arguments: arguments),
  '/first': (contxt) => const RouteFirstDemo(),
  '/second': (contxt) => const RouteSecondDemo(),
  '/third': (contxt) => const RouteThirdDemo(),
  '/dialog': (contxt) => const DialogDemo(),
  '/pageView': (contxt) => const PageViewDemo(),
  '/pageViewB': (contxt) => const PageViewBuilderDemo(),
  '/pageViewF': (contxt) => const PageViewFullDemo(),
  '/pageViewS': (contxt) => const PageViewSwiperDemo(),
  '/keyBasicDemo': (contxt) => const KeyBasicDemo(),
  '/globalKeyDemo': (contxt) => const GlobalKeyDemo(),
  '/globalKeyUse': (contxt) => const GlobalKeyUseDemo(),
  '/sliverDemo': (contxt) => const SliverDemo(),
  '/persistentHeader': (contxt) => const PersistentHeaderRoute(),
};

void addRoute() {
  for (var element in aPosts) {
    Map<String, Function> temp = {element.route: element.wFunction};
    routes.addAll(temp);
  }
}

var onGenerateRoute = (RouteSettings settings) {
  addRoute();
// 统一处理
  final String? name = settings.name; // 取path 也就是Map里的key
  final Function? pageContentBuilder = routes[name]; // 根据key取function
  if (pageContentBuilder != null) {
    // function为空，返回null
    if (settings.arguments != null) {
      // 有参数，传参
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      // 无参数直接跳转
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};
