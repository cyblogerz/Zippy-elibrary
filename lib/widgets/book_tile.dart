import 'package:flutter/material.dart';
import 'package:zippy/pages/book_details.dart';
import 'package:zippy/widgets/rating.dart';

class BookTile extends StatelessWidget {
  const BookTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => Navigator.push(context,
          MaterialPageRoute(builder: ((context) => BookDetailsPage())))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        child: Column(
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
              Positioned(right: 10, top: 10, child: Rating()),
            ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Essential Things',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  'Errico Pucci',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
