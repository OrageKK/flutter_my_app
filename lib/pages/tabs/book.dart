import 'package:flutter/material.dart';
import '../../model/post.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  Widget _itemBuilder(BuildContext context, int index) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: const Color(0xFFb9dec9),
      child: Column(
        children: [
          Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
            width: (size.width-10)/2,
            height: (size.width-10)/2,
          ),
          const SizedBox(height: 5.0),
          Text(
            posts[index].title,
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            posts[index].author,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(height: 5.0)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: posts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 0.77,
        ),
        // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        //   // crossAxisCount: 3, // SliverGridDelegateWithFixedCrossAxisCount使用
        //   maxCrossAxisExtent: 350,
        //   crossAxisSpacing: 8.0,
        //   mainAxisSpacing: 8.0,
        //   childAspectRatio: 0.9,
        // ),
        itemBuilder: _itemBuilder);
  }
}
