import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zippy/widgets/search_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ],
          ),
        ));
  }
}
