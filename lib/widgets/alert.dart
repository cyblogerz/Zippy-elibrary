import 'package:flutter/material.dart';

showAlertDialog(BuildContext context) {
  Widget okButton = ElevatedButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog downloadAlert = AlertDialog(
    title: Text("Important Notice"),
    content: Text(
        "Due to the limitations of the google books api, this book can't be downloaded right now. Currently , you can only read pdf files with this app"),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return downloadAlert;
    },
  );
}
