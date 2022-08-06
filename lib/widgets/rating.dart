import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Icon(
              Icons.star,
              color: Color(0xffFFBE36),
              size: 14,
            ),
          ),
          Text(
            '4.7',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
