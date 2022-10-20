import 'package:my_app/pages/demo/animation/animatedPadding.dart';

import '../pages/demo/animation/animatedContainer.dart';
import '../pages/demo/animation/animatedDefaultTextStyle.dart';
import '../pages/demo/animation/animatedIcon.dart';
import '../pages/demo/animation/animatedOpacity.dart';
import '../pages/demo/animation/animatedPositioned.dart';
import '../pages/demo/animation/animatedSwitcher.dart';
import '../pages/demo/animation/fadeTransition.dart';
import '../pages/demo/animation/rotationTransition.dart';
import '../pages/demo/animation/scaleTransition.dart';
import '../pages/demo/animation/slideTransition.dart';
import '../pages/demo/animation/交错动画.dart';

class AnimatedPage {
  const AnimatedPage({
    required this.title,
    required this.subTitle,
    required this.route,
    required this.wFunction,
  });

  final String title;
  final String subTitle;
  final String route;
  final Function wFunction;
}

List<AnimatedPage> aPosts = [
  AnimatedPage(
    title: 'AnimatedContainerDemo',
    subTitle: '隐式动画',
    route: '/aContainer',
    wFunction: (contxt, {arguments}) =>
        AnimatedContainerDemo(arguments: arguments),
  ),
  AnimatedPage(
    title: 'AnimatedPaddingDemo',
    subTitle: '隐式动画',
    route: '/aPadding',
    wFunction: (contxt, {arguments}) =>
        AnimatedPaddingDemo(arguments: arguments),
  ),
  AnimatedPage(
    title: 'AnimatedOpacityDemo',
    subTitle: '隐式动画',
    route: '/aOpacity',
    wFunction: (contxt, {arguments}) =>
        AnimatedOpacityDemo(arguments: arguments),
  ),
  AnimatedPage(
    title: 'AnimatedPositionedDemo',
    subTitle: '隐式动画',
    route: '/aPositioned',
    wFunction: (contxt, {arguments}) =>
        AnimatedPositionedDemo(arguments: arguments),
  ),
  AnimatedPage(
    title: 'AnimatedDefaultTextStyleDemo',
    subTitle: '隐式动画',
    route: '/aDefaultTextStyle',
    wFunction: (contxt, {arguments}) =>
        AnimatedDefaultTextStyleDemo(arguments: arguments),
  ),
  AnimatedPage(
    title: 'AnimatedSwitcherDemo',
    subTitle: '隐式动画',
    route: '/aSwitcher',
    wFunction: (contxt, {arguments}) =>
        AnimatedSwitcherDemo(arguments: arguments),
  ),
  AnimatedPage(
    title: 'RotationTransitionDemo',
    subTitle: '显式动画',
    route: '/aRotation',
    wFunction: (contxt, {arguments}) =>
        RotationTransitionDemo(arguments: arguments),
  ),
  AnimatedPage(
    title: 'FadeTransitionDemo',
    subTitle: '显式动画',
    route: '/aFade',
    wFunction: (contxt, {arguments}) =>
        FadeTransitionDemo(arguments: arguments),
  ),
  AnimatedPage(
    title: 'ScaleTransitionDemo',
    subTitle: '显式动画',
    route: '/aScale',
    wFunction: (contxt, {arguments}) =>
        ScaleTransitionDemo(arguments: arguments),
  ),
  AnimatedPage(
    title: 'SlideTransitionDemo',
    subTitle: '显式动画',
    route: '/aSlide',
    wFunction: (contxt, {arguments}) =>
        SlideTransitionDemo(arguments: arguments),
  ),
  AnimatedPage(
    title: 'AnimatedIconDemo',
    subTitle: '显式动画',
    route: '/aAicon',
    wFunction: (contxt, {arguments}) =>
        AnimatedIconDemo(arguments: arguments),
  ),
  AnimatedPage(
    title: 'StaggeredAnimatedDemo',
    subTitle: '交错动画',
    route: '/aStaggered',
    wFunction: (contxt, {arguments}) =>
        StaggeredAnimatedDemo(arguments: arguments),
  ),
];
