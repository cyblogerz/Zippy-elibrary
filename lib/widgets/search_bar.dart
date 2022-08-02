import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32), color: Color(0xffF5F5F5)),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.search,
              color: Colors.grey,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'Search books',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
