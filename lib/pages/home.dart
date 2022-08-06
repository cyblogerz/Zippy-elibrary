// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zippy/utils/book_view.dart';
import 'package:zippy/pages/pdf_landing.dart';
import 'package:zippy/pages/settings_page.dart';
import 'package:zippy/providers/bookData.dart';
import 'package:zippy/widgets/book_tile.dart';
import 'package:zippy/widgets/gradient_widget.dart';
import 'package:zippy/widgets/search_bar.dart';
// import 'package:zippy/widgets/shimmer_widget.dart';

import '../models/book.dart';
import '../widgets/cat_tag.dart';
import 'home_body.dart';

class Home extends StatefulWidget {
  static String id = "/";
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

int _currentIndex = 0;

class _HomeState extends State<Home> {
  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [HomeBody(), Explore(), SettingsPage()];
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          extendBody: true,
          bottomNavigationBar: DotNavigationBar(
            currentIndex: _currentIndex,
            onTap: changePage,
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(110, 158, 158, 158),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 5))
            ],
            items: [
              DotNavigationBarItem(
                  icon: Icon(Icons.home, size: 25),
                  selectedColor: Colors.red,
                  unselectedColor: Colors.black54),
              DotNavigationBarItem(
                  icon: Icon(Icons.library_books, size: 25),
                  selectedColor: Color(0xff6540FF),
                  unselectedColor: Colors.black54),
              DotNavigationBarItem(
                  icon: Icon(Icons.settings, size: 25),
                  selectedColor: Colors.teal,
                  unselectedColor: Colors.black54),
            ],
          ),
          backgroundColor: Colors.white,
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.pink),
                    currentAccountPicture: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                          'https://avatars.githubusercontent.com/u/74711322?v=4'),
                    ),
                    accountName: Text('NewUser'),
                    accountEmail: Text('userNew@email.com')),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.info_outline_rounded,
                    size: 25,
                  ),
                  title: Text('About'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.catching_pokemon_rounded,
                    size: 25,
                  ),
                  title: Text('View Project on Github'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.change_circle_outlined,
                    size: 25,
                  ),
                  title: Text('ChangeLogs'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.bug_report,
                    size: 25,
                  ),
                  title: Text('Bug Reports'),
                )
              ],
            ),
          ),
          appBar: AppBar(
            // automaticallyImplyLeading: false,
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            title: Text(
              'Zippy',
              style: TextStyle(color: Colors.black),
            ),
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
          body: pages.elementAt(_currentIndex)),
    );
  }
}
