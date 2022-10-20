import 'package:flutter/material.dart';
import 'package:my_app/pages/tabs/message.dart';
import 'component/wrap.dart';
import 'tabs/book.dart';
import 'tabs/mine.dart';
import 'tabs/home.dart';
import 'tabs/list.dart';
import 'drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    HomePage(),
    BookPage(),
    MessagePage(),
    ListDemo(),
    MinePage(),
  ];
  void changeIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        title: const Text('Flutter Demo'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: ((context) {
              return const WrapDemo();
            }))),
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _pages[_currentIndex],
      drawer: const DrawerDemo(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeIndex,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed, // 4个以上(含)就需要配置
        // fixedColor: Colors.red, 已淘汰
        selectedItemColor: Theme.of(context).primaryColorDark,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Book',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My',
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 10), // 调整位置
        padding: const EdgeInsets.all(4),
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          color: Theme.of(context).bottomAppBarColor,
          borderRadius: BorderRadius.circular(55 / 2),
        ),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _currentIndex = 2;
            });
          },
          backgroundColor: _currentIndex == 2
              ? Theme.of(context).primaryColorDark
              : Colors.yellow,
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, // 配置floatingActionButton的位置
    );
  }
}
