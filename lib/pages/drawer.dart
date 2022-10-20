import 'package:flutter/material.dart';
import 'package:my_app/pages/component/wrap.dart';

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'Oragekk',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: const Text('Oragekk@gmail.com'),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/18461481?v=4'),
            ),
            decoration: BoxDecoration(
              color: Colors.yellow[400],
              image: DecorationImage(
                image: const NetworkImage(
                    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201604%2F14%2F20160414153713_RtrXH.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1667972319&t=47f554af271b23216902faddf2e08b52'),
                // 填满整个区域
                fit: BoxFit.cover,
                // 滤镜（ColorFilter.mode 两个参数：颜色，混合模式）
                colorFilter: ColorFilter.mode(
                  Colors.yellow[400]!.withOpacity(0.6),
                  BlendMode.hardLight,
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Messages',
              textAlign: TextAlign.right,
            ),
            trailing: const Icon(
              Icons.message,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: const Text(
              'Favorite',
              textAlign: TextAlign.right,
            ),
            trailing: const Icon(
              Icons.favorite,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: const Text(
              'Settings',
              textAlign: TextAlign.right,
            ),
            trailing: const Icon(
              Icons.settings,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
