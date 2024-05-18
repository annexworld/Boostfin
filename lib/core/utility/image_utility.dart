import 'package:boostfin/core/utility/extension_fun.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

Future<XFile?> imagePicker(ImageSource imgscr) async {
  try {
    final image = await ImagePicker().pickImage(
        source: imgscr, imageQuality: 50, maxWidth: 800, maxHeight: 800);
    if (image == null) {
      return null;
    }

    XFile img = XFile(image.path);
    'IMAGE_SELECTED_TYPE: ${image.mimeType}'.debugString;
    'IMAGE_SELECTED_PATH: ${image.path}'.debugString;
    'IMAGE_SELECTED_FILE_NAME: ${image.name}'.debugString;

    return img;
  } on PlatformException catch (error) {
    'IMAGE_SELECTION_ERROR: $error'.debugString;
    return null;
  }
}
