import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // top: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100.0),
        child: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Color.fromARGB(110, 158, 158, 158),
                spreadRadius: 5,
                blurRadius: 10,
                offset: Offset(0, 5))
          ], borderRadius: BorderRadius.circular(32), color: Colors.white),
          child: Text('This is a demo app developed for SECURE dev Task'),
        ),
      ),
    );
  }
}
