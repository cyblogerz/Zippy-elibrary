import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zippy/models/book.dart';
import 'package:http/http.dart' as http;
import 'package:zippy/widgets/book_list_tile.dart';
import 'package:zippy/widgets/book_tile.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
      child: GestureDetector(
        onTap: (() =>
            {showSearch(context: context, delegate: CustomSearchDelegate())}),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Color(0xffF5F5F5)),
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
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  Future<List<Book>> _fetchBooks() async {
    String url = 'https://www.googleapis.com/books/v1/volumes?q=$query'
        '&key=AIzaSyAkHS0mQjY6viod7RRWULRjuPC1azZTADQ';
    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return _parseBookJson(res.body);
    } else {
      throw Exception('Error: ${res.statusCode}');
    }
  }

  List<Book> _parseBookJson(String jsonStr) {
    final jsonMap = json.decode(jsonStr);
    final jsonList = (jsonMap['items'] as List);
    return jsonList
        .map((jsonBook) => Book(
              title: jsonBook['volumeInfo']['title'].toString(),
              author: (jsonBook['volumeInfo']['authors'] ?? [] as List)
                  .elementAt(0)
                  .toString(),
              description: jsonBook['volumeInfo']['description'].toString(),
              thumbnailUrl: jsonBook['volumeInfo']['imageLinks']
                      ['smallThumbnail']
                  .toString(),
            ))
        .toList();
  }

  @override
  Widget buildResults(BuildContext context) => Scaffold(
        body: FutureBuilder(
            future: _fetchBooks(),
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
  // TODO: implement buildResults

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];

          return ListTile(
            title: Text(suggestion),
            onTap: () {
              query = suggestion;
              showResults(context);
            },
          );
        });
  }
}

List<String> suggestions = [
  'Wimpy kid',
  'Think like a monk',
  'Pride and prejudice',
  'Immortals of meluha'
];
