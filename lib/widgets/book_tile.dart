import 'package:flutter/material.dart';

class BookTile extends StatelessWidget {
  const BookTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://i.pinimg.com/736x/69/7b/90/697b90a297a3f4d941730106c074071c.jpg',
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.25,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Text('4.7')
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ]),
        Column(
          children: <Widget>[Text('Essential Things'), Text('Errico Pucci')],
        )
      ],
    );
  }
}
