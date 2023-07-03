import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zippy/utils/book_view.dart';
import 'package:zippy/models/book.dart';
import 'package:http/http.dart' as http;
import 'package:zippy/pages/result_list.dart';
import 'package:zippy/widgets/book_list_tile.dart';
import 'package:zippy/widgets/book_tile.dart';

import '../providers/bookData.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
      child: GestureDetector(
        onTap: (() =>
            {showSearch(context: context, delegate: CustomSearchDelegate())}),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Color.fromARGB(75, 158, 158, 158),
                spreadRadius: 5,
                blurRadius: 10,
                offset: Offset(0, 5))
          ], borderRadius: BorderRadius.circular(32), color: Color(0xffF5F5F5)),
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
          Navigator.pop(context);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    var bData = Provider.of<BookData>(context, listen: false);
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) => ResultList(query: query);
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
  'manga',
  'marvel',
  'Pride and prejudice',
  'Immortals of meluha'
];
