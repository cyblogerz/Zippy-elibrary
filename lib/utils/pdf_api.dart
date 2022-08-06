import 'dart:io';

import 'package:file_picker/file_picker.dart';

Future pickFile() async {
  final res = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf'],
  );
  if (res == null) return null;
  return File(res.paths.first.toString());
}
