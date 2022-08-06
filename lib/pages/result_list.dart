import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../apis/book_view.dart';
import '../models/book.dart';
import '../widgets/book_list_tile.dart';

class ResultList extends StatefulWidget {
  final String query;
  const ResultList({Key? key, required this.query}) : super(key: key);

  @override
  State<ResultList> createState() => _ResultListState();
}

class _ResultListState extends State<ResultList> {
  ScrollController _scrollController = ScrollController();
  List<Widget> items = [];
  int indexNumber = 1;

  Future<List<Book>> getLazyData({int indexNumber = 1}) async {
    // indexNum = indexNumber;
    final url = Uri.parse(
        'https://www.googleapis.com/books/v1/volumes?q=${widget.query}&startIndex=$indexNumber');
    print(url);

    final res = await http.get(url);

    if (res.statusCode == 200) {
      return _parseBookJson(res.body);
    } else {
      // print(indexNumber);
      throw Exception('Error: ${res.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        indexNumber = indexNumber + 10;
        setState(() {}); //
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<Book> _parseBookJson(String jsonStr) {
    final jsonMap = jsonDecode(jsonStr);

    final jsonList = (jsonMap['items'] as List);

    return jsonList
        .map((jsonBook) => Book(
            title: jsonBook['volumeInfo']['title'] != null
                ? jsonBook['volumeInfo']['title']
                : 'The Book',
            author: jsonBook['volumeInfo']['authors'] != null
                ? jsonBook['volumeInfo']['authors'][0]
                : 'John Doe',
            description: jsonBook['volumeInfo']['description'],
            thumbnailUrl: jsonBook['volumeInfo']['imageLinks'] != null
                ? jsonBook['volumeInfo']['imageLinks']['thumbnail']
                : 'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'))
        .toList();
  }

  // Widget createListView(BuildContext context, AsyncSnapshot snapshot){

  // }

  // Future LazyFetch({indexNumber}) async {
  //   const limit = 10;
  //   final url = Uri.parse(
  //       'https://www.googleapis.com/books/v1/volumes?q=${widget.query}&startIndex=$indexNumber');

  //   final response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     final jsonMap = jsonDecode(response.body);

  //     final jsonList = (jsonMap['items'] as List);

  //     return jsonList
  //         .map((jsonBook) => Book(
  //             title: jsonBook['volumeInfo']['title'] != null
  //                 ? jsonBook['volumeInfo']['title']
  //                 : 'The Book',
  //             author: jsonBook['volumeInfo']['authors'] != null
  //                 ? jsonBook['volumeInfo']['authors'][0]
  //                 : 'John Doe',
  //             description: jsonBook['volumeInfo']['description'],
  //             thumbnailUrl: jsonBook['volumeInfo']['imageLinks'] != null
  //                 ? jsonBook['volumeInfo']['imageLinks']['thumbnail']
  //                 : 'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'))
  //         .toList();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getLazyData(),
          builder: (context, AsyncSnapshot<List<Book>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return ListView(
                    children:
                        snapshot.data!.map((b) => BookListTile(b)).toList());
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
