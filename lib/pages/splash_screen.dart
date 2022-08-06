import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:splashscreen/splashscreen.dart';
import 'package:zippy/pages/home.dart';

import '../providers/bookData.dart';

class Splash extends StatefulWidget {
  static String id = "/splash";
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var bookData = Provider.of<BookData>(context, listen: false);
      bookData.addTrending();
      bookData.addFantasy();
      bookData.addadventure();
      bookData.addnovels();
      Navigator.pushNamed(context, Home.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Home())));
    return Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
