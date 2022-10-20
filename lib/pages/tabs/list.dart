import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app/model/animated.dart';

class ListDemo extends StatefulWidget {
  const ListDemo({super.key});

  @override
  State<ListDemo> createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {
  void _toast() {
    Fluttertoast.showToast(
        msg:
            "别点了，没用",
        toastLength: Toast.LENGTH_SHORT, // 只针对Android
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1, // iOS和web时间
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
  
  Widget _buildItem(BuildContext context, int index) {
    return Column(
      children: [
        ListTile(
          title: Text(aPosts[index].title),
          subtitle: Text(aPosts[index].subTitle),
          onTap: () {
            Navigator.pushNamed(context, aPosts[index].route,arguments: {'title':aPosts[index].title});
          },
        ),
        const Divider()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: 'listAnimTag',
          onPressed: _toast,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: aPosts.length, itemBuilder: _buildItem));
  }
}
