import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class PDFViewerPage extends StatefulWidget {
  final File file;

  const PDFViewerPage({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  late PDFViewController controller;
  int pages = 0;
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);
    final text = '${indexPage + 1} of $pages';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6540FF),
        title: Text(name),
        actions: pages >= 2
            ? [
                Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Center(child: Text(text))),
              ]
            : null,
      ),
      body: Stack(children: [
        PDFView(
          filePath: widget.file.path,
          // autoSpacing: false,
          // swipeHorizontal: true,
          // pageSnap: false,
          // pageFling: false,
          onRender: (pages) => setState(() => this.pages = pages!),
          onViewCreated: (controller) =>
              setState(() => this.controller = controller),
          onPageChanged: (indexPage, _) =>
              setState(() => this.indexPage = indexPage!),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            width: 100,
            decoration: BoxDecoration(
              color: Color(0xff6540FF),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.chevron_left, size: 32, color: Colors.white),
                  onPressed: () {
                    final page = indexPage == 0 ? pages : indexPage - 1;
                    controller.setPage(page);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.chevron_right,
                    size: 32,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    final page = indexPage == pages - 1 ? 0 : indexPage + 1;
                    controller.setPage(page);
                  },
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
