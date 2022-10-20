import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../model/post.dart';

class HomeListPage extends StatelessWidget {
  const HomeListPage({super.key});

  Widget itemBuilder(BuildContext context, int index) {
    return Container(
        color: const Color(0xFFb9dec9),
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            CachedNetworkImage(imageUrl: posts[index].imageUrl),
            const SizedBox(height: 16.0),
            Text(
              posts[index].title,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              posts[index].author,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 16.0)
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: posts.length, itemBuilder: itemBuilder);
  }
}
