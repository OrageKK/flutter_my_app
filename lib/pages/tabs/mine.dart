import 'package:flutter/material.dart';
import '../component/card.dart';
// import '../../pages/layoutdemo.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    // return const LayoutDemo();
    return const CardDemo();
  }
}
