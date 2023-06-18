import 'dart:developer';

import 'package:image_picker/image_picker.dart';

Future<String> pickImage({ImageSource? source}) async {
  // ignore: unused_local_variable
  final picker = ImagePicker();

  // ignore: unused_local_variable
  String path = '';

  try {
    final getImage = await picker.pickImage(source: source!);

    if (getImage != null) {
      path = getImage.path;
    } else {
      path = '';
    }
  } catch (e) {
    log(e.toString());
  }

  return path;
}
