import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/book.dart';
import 'package:http/http.dart' as http;

// String api_key = 'AIzaSyAkHS0mQjY6viod7RRWULRjuPC1azZTADQ';

String trending_url =
    "https://www.googleapis.com/books/v1/volumes?q=+subject:manga";
String adventure_url =
    "https://www.googleapis.com/books/v1/volumes?q=+subject:adventure";
String fantasy_url =
    "https://www.googleapis.com/books/v1/volumes?q=+subject:fantasy";
String novel_url =
    "https://www.googleapis.com/books/v1/volumes?q=+subject:novel";
String fiction_url =
    "https://www.googleapis.com/books/v1/volumes?q=+subject:fiction";

Future<List<Book>> getBooksData(String url) async {
  final res = await http.get(Uri.parse(url));

  if (res.statusCode == 200) {
    return _parseBookJson(res.body);
  } else {
    throw Exception('Error: ${res.statusCode}');
  }
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

Future<List> fetchData() async {
  final results = await Future.wait([
    getBooksData(trending_url),
    getBooksData(adventure_url),
    getBooksData(novel_url),
    getBooksData(fantasy_url)
  ]);

  return results;
}