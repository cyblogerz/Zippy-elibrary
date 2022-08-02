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
        drawer: Drawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.search))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Hello, Timmy!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SearchBar(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Popular Genre',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CatTag(color: Colors.red, tag: '📖 Novel'),
                  CatTag(color: Colors.blue, tag: '⚡ Self-Help'),
                  CatTag(color: Colors.green, tag: 'Fantasy')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CatTag(color: Colors.red, tag: 'True Crime'),
                  CatTag(color: Colors.green, tag: 'Science Fiction Fantasy')
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
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
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
