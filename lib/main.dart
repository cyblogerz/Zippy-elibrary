import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zippy/pages/home.dart';
import 'package:zippy/pages/splash_screen.dart';

import 'providers/bookData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => BookData()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        routes: {
          Home.id: (context) => const Home(),
          Splash.id: (ctx) => const Splash(),
        },
        initialRoute: Splash.id,
      ),
    );
  }
}
