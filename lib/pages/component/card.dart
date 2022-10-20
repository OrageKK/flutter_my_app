import 'package:flutter/material.dart';
import '../../model/post.dart';

class CardDemo extends StatefulWidget {
  const CardDemo({super.key});

  @override
  State<CardDemo> createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  Widget itemBuilder(BuildContext context, int index) {
    var size = MediaQuery.of(context).size;
    return Card(
      elevation: 2, // 阴影值深度
      margin: const EdgeInsets.all(10),
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // 圆角
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      posts[index].title,
                      style: const TextStyle(
                          fontSize: 17,
                          color: Color(0xff333333),
                          fontWeight: FontWeight.w400),
                    ),
                   SizedBox(
                      width: size.width - 150,
                      child: const Divider(
                        color: Color(0xffebebeb),
                        thickness: 1,
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      // padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(
                        posts[index].author,
                        style: const TextStyle(
                            fontSize: 13, color: Color(0xff999999)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  //圆形图片
                  width: 60,
                  height: 60,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(posts[index].imageUrl),
                  ),
                ),
                // ClipOval(
                //   child: Image.network(
                //     posts[index].imageUrl,
                //     width: 60,
                //     height: 60,
                //     fit:BoxFit.cover
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(posts[index].imageUrl)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: posts.length, itemBuilder: itemBuilder);
  }
}
