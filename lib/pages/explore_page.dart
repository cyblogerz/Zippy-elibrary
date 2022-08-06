import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zippy/apis/pdf_api.dart';
import 'package:zippy/pages/pdf_view.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child:
                SvgPicture.asset('assets/images/undraw_reading_re_29f8.svg')),
        Column(
          children: [
            Text(
              'Open Books',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(164, 0, 0, 0)),
            ),
            Text(
              'Load books from your device storage',
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(26.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xff6540FF),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ))),
              onPressed: () async {
                final file = await pickFile();
                if (file == null) return;
                openPdf(context, file);
              },
              child:
                  Padding(padding: EdgeInsets.all(18), child: Text('Open PDF')),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
        ),
      ],
    );
  }

  void openPdf(BuildContext context, File file) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)));
  }
}
