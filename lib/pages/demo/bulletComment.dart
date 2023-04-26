import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BulletComment extends StatefulWidget {
  const BulletComment({super.key});

  @override
  State<BulletComment> createState() => _BulletCommentState();
}

class _BulletCommentState extends State<BulletComment> {
  late ScrollController _controller;
  late Timer _timer;
  double _offset = 0.0;
  // A list of words to display
  final List<String> words = [
    'Hello-1',
    'World-2',
    'Flutter-3',
    'Dart-4',
    'Widget-5',
    'List-6',
    'Grid-7',
    'Scroll-8',
    'Horizontal-9',
    'Vertical-10',
    'Html-11',
    'Dart-12',
    'Widget-13',
    'List-14',
    'Grid-15',
    'Scroll-16',
    'Horizontal-17',
    'Vertical-18',
    'Html-19'
  ];

  @override
  void initState() {
    super.initState();
    _controller = ScrollController(initialScrollOffset: _offset);
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      double newOffset = _controller.offset + 80;
      if (newOffset != _offset) {
        _offset = newOffset;
        _controller.animateTo(_offset,
            duration: const Duration(seconds: 2), curve: Curves.linear);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = window.physicalSize.width / window.devicePixelRatio;

    return Column(
      children: [
        GestureDetector(
          onTapUp: (details) {
            _timer.cancel();
            Timer(const Duration(milliseconds: 100), () {
              GestureBinding.instance.handlePointerEvent(PointerAddedEvent(
                  pointer: 0, position: details.globalPosition));
              GestureBinding.instance.handlePointerEvent(PointerDownEvent(
                  pointer: 0, position: details.globalPosition));
              GestureBinding.instance.handlePointerEvent(
                  PointerUpEvent(pointer: 0, position: details.globalPosition));
            });
          },
          child: Container(
            height: 120,
            margin: const EdgeInsets.only(top: 30),
            child: MasonryGridView.count(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              controller: _controller,
              scrollDirection: Axis.horizontal,
              crossAxisCount: 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
              itemBuilder: (context, index) {
                int remainder = index % words.length;
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Fluttertoast.showToast(msg: words[remainder]);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: getRandomColor(),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(words[remainder]),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

Color getRandomColor() {
  Random random = Random();
  Color color = Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
  return color;
}
