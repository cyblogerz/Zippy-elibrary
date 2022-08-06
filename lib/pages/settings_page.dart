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
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.purple, Colors.deepPurple, Colors.blueAccent],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(75, 124, 77, 255),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 5))
              ],
              borderRadius: BorderRadius.circular(32),
              color: Colors.white),
          child: const Text(
            'This is a demo app developed for SECURE dev Task',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
