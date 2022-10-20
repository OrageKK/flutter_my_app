import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app/pages/component/mydialog.dart';

class DialogDemo extends StatefulWidget {
  const DialogDemo({super.key});

  @override
  State<DialogDemo> createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
  void _alertDialog() async {
    var result = await showDialog(
        barrierDismissible: true, // 是否点击背景dismiss
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('提示'),
            content: const Text('确定要删除吗'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'Cancle');
                },
                child: const Text('取消',
                    style: TextStyle(color: Color(0xFF3480FF))),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'Ok');
                },
                child: const Text('确定',
                    style: TextStyle(color: Color(0xFF3480FF))),
              ),
            ],
          );
        });

    print(result); // 获取点击按钮传的值
  }

  void _SimpleDialog() async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('抉择吧'),
            children: [
              SimpleDialogOption(
                child: const Text('重命名'),
                onPressed: () {
                  Navigator.pop(context, '重命名');
                  print('重命名');
                },
              ),
              SimpleDialogOption(
                child: const Text('删除'),
                onPressed: () => print('删除'),
              ),
              SimpleDialogOption(
                child: const Text('上传'),
                onPressed: () => print('上传'),
              ),
            ],
          );
        });
    print('result=$result');
  }

  void _showModalBottomSheet() async {
    var result = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 220,
            child: Column(
              children: [
                ListTile(
                  title: Text('分享A'),
                  onTap: () {
                    Navigator.pop(context, "分享 A");
                  },
                ),
                const Divider(),
                ListTile(
                  title: Text('分享B'),
                  onTap: () {
                    Navigator.pop(context, "分享 B");
                  },
                ),
                const Divider(),
                ListTile(
                  title: Text('分享C'),
                  onTap: () {
                    Navigator.pop(context, "分享 C");
                  },
                ),
              ],
            ),
          );
        });
    print('result=$result');
  }

  void _toast() {
    Fluttertoast.showToast(
        msg:
            "This is Center Short Toast\nLooking for iOS Dev who can check out and fix the issues releated to iOS (I dont have a Mac and iOS)",
        toastLength: Toast.LENGTH_SHORT, // 只针对Android
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1, // iOS和web时间
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void myDialog() async {
    var result = await showDialog(
        barrierDismissible: false, // 点击灰色背景不消失
        context: context,
        builder: (context) {
          return MyDialog(
            title: '自定义弹窗',
            content: '这是显示内容',
            onClosed: () {
              Navigator.pop(context,'自定义取消');;
            },
          );
        });
    print('自定义的Dialog-result=$result');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _alertDialog,
            child: const Text('alert弹框-AlertDialog'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: _SimpleDialog,
            child: const Text('select弹框-SimpleDialog'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: _showModalBottomSheet,
            child: const Text('ActionSheet弹框-showModalBottomSheet'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: _toast,
            child: const Text('Toast'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: myDialog,
            child: const Text('自定义dialog'),
          )
        ],
      ),
    );
  }
}
