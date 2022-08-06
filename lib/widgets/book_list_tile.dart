import 'package:flutter/material.dart';
import 'package:zippy/pages/book_details.dart';
import 'package:zippy/widgets/rating.dart';

import '../models/book.dart';

class BookListTile extends StatelessWidget {
  final Book book;
  BookListTile(this.book);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => BookDetailsPage(
                    book: book,
                  )))),
      child: Container(
        color: Colors.white,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          child: Row(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.16,
                width: MediaQuery.of(context).size.height * 0.12,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    book.thumbnailUrl.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.16,
                margin: EdgeInsets.only(left: 20),
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      book.title.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      book.author.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.blueGrey, fontSize: 12),
                    ),
                    Container(width: 43, child: Rating())
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
