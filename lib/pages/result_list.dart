import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../apis/book_view.dart';
import '../models/book.dart';
import '../providers/bookData.dart';
import '../widgets/book_list_tile.dart';

class ResultList extends StatefulWidget {
  final String query;

  const ResultList({Key? key, required this.query}) : super(key: key);

  @override
  State<ResultList> createState() => _ResultListState();
}

class _ResultListState extends State<ResultList> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var bookData = Provider.of<BookData>(context, listen: false);
      bookData.addSearchres(query: widget.query, indexNumber: 0);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final booksData = Provider.of<BookData>(context);
    final searchResults = booksData.searchres;

    return Scaffold(
        body: ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                  value: searchResults[index],
                  child: BookListTile(searchResults[index]),
                )));
  }
}
