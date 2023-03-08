import 'package:flutter/material.dart';

class AnimatedDouDemo extends StatefulWidget {
  final Map arguments;
  const AnimatedDouDemo({super.key, required this.arguments});

  @override
  State<AnimatedDouDemo> createState() => _AnimatedDouDemoState();
}

class _AnimatedDouDemoState extends State<AnimatedDouDemo>
    with SingleTickerProviderStateMixin {
  bool flag = true;
  late Animation<double> _animation;
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 200),
    );
    _animation = Tween(begin: -0.03, end: 0.03).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.repeat(reverse: true);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: 'ianim',
        child: const Icon(Icons.leak_add),
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
      ),
      appBar: AppBar(
        title: Text(widget.arguments['title']),
      ),
      body: RotationTransition(
        turns: _animation,
        child: Center(
          child: ClipRRect(
            // borderRadius: BorderRadius.circular(45),
            child: Container(
              alignment: Alignment.center,
              color: Colors.red,
              width: 90,
              height: 90,
            ),
          ),
        ),
      ),
    );
  }
}
