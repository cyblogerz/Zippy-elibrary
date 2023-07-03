import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bookData.dart';
import '../widgets/book_tile.dart';
import '../widgets/cat_tag.dart';
import '../widgets/gradient_widget.dart';
import '../widgets/search_bar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final booksData = Provider.of<BookData>(context);
    final trendingBooks = booksData.trending;
    final novels = booksData.novels;
    final fantasy = booksData.fantasy;
    final adventure = booksData.adventure;
    return ListView(
      padding: EdgeInsets.all(0),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        ),
        MySearchBar(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
          child: Text(
            'Popular Genres',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CatTag(color: Colors.red, tag: '📖 Novel'),
            CatTag(color: Colors.blue, tag: '⚡ Self-Help'),
            CatTag(color: Colors.green, tag: '🔮  Fantasy')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CatTag(color: Colors.teal, tag: '🔪  True Crime'),
            CatTag(color: Colors.pink, tag: '🔬 Science Fiction Fantasy')
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10, left: 16),
          child: Text(
            'Trending now',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.36,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: trendingBooks.length,
              itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                    value: trendingBooks[index],
                    child: BookTile(
                      book: trendingBooks[index],
                    ),
                  )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 10, left: 16),
          child: Text(
            'Adventure',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.36,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: adventure.length,
              itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                    value: adventure[index],
                    child: BookTile(
                      book: adventure[index],
                    ),
                  )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 10, left: 16),
          child: Text(
            'Novel',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.36,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: novels.length,
              itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                    value: novels[index],
                    child: BookTile(
                      book: novels[index],
                    ),
                  )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 10, left: 16),
          child: Text(
            'Fantasy',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.36,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: fantasy.length,
              itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                    value: fantasy[index],
                    child: BookTile(
                      book: fantasy[index],
                    ),
                  )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10, left: 16),
          child: Text(
            'Explore Zippy',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 100.0),
          child: GradientWidget(),
        )
      ],
    );
  }
}
