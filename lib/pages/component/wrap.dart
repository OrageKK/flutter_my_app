import 'package:flutter/material.dart';

class WrapDemo extends StatelessWidget {
  const WrapDemo({super.key});

  void click() {
    debugPrint('点击了');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10,
        automaticallyImplyLeading: false, //隐藏返回箭头
        title: const SizedBox(
          width: double.infinity,
          height: 30,
          child: TextField(
            textAlign: TextAlign.start,
            cursorColor: Colors.grey, // 光标颜色
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              filled: true,
              fillColor: Color(0xfff1f1f1),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              hintText: "请输入关键词",
              // suffixIcon: Icon(Icons.clear),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18.0)),
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18.0)),
                  borderSide: BorderSide(color: Colors.transparent)),
            ),
            // onChanged: (value) => print(value),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => {Navigator.pop(context)},
            child: const Text('取消',style: TextStyle(color: Colors.black),),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Row(
            children: const [
              Text('热搜',
                  style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          const Divider(),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              WarpButton('手机', onPressed: click),
              WarpButton('电脑', onPressed: click),
              WarpButton('护眼仪', onPressed: click),
              WarpButton('脱毛仪', onPressed: click),
              WarpButton('iPhone 13 Pro', onPressed: click),
              WarpButton('鼠标o', onPressed: click),
              WarpButton('电脑支架', onPressed: click),
              WarpButton('纸巾', onPressed: click),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: const [
              Text('历史记录',
                  style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          const Divider(),
          Column(
            children: const [
              ListTile(title: Text('手机')),
              Divider(),
              ListTile(title: Text('iPhone 13 Pro')),
              Divider(),
              ListTile(title: Text('鼠标o')),
              Divider(),
              ListTile(title: Text('纸巾')),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton.icon(
              onPressed: () {
                debugPrint('清空');
              },
              icon: const Icon(Icons.delete),
              label: const Text('清空历史记录')),
        ],
      ),
    );
  }
}

// 自定义按钮
class WarpButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const WarpButton(this.title, {super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(245, 210, 207, 207)),
        foregroundColor: MaterialStateProperty.all(Colors.black45),
      ),
      child: Text(title),
    );
  }
}
