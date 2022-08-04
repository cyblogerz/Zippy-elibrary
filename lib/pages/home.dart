import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zippy/widgets/book_tile.dart';
import 'package:zippy/widgets/search_bar.dart';

import '../widgets/cat_tag.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // drawer: Drawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: CircleAvatar(
                backgroundColor: Color(0xffEEEFEE),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.black,
                    )),
              ),
            )
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Text(
                'Hello, Timmy!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SearchBar(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
              child: Text(
                'Popular Genre',
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BookTile(),
                  BookTile(),
                  BookTile(),
                  BookTile(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10, left: 16),
              child: Text(
                'Self-Help Genre',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BookTile(),
                  BookTile(),
                  BookTile(),
                  BookTile(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10, left: 16),
              child: Text(
                'Novel',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BookTile(),
                  BookTile(),
                  BookTile(),
                  BookTile(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10, left: 16),
              child: Text(
                'Fantasy',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BookTile(),
                  BookTile(),
                  BookTile(),
                  BookTile(),
                ],
              ),
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
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CatTag(color: Colors.red, tag: 'Genre'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CatTag(color: Colors.blue, tag: 'Top Selling'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CatTag(color: Colors.teal, tag: 'New releases'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CatTag(color: Colors.pink, tag: 'Comics'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
