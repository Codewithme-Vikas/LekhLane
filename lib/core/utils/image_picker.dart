import 'package:image_picker/image_picker.dart';

Future<XFile?> imagePicker(ImageSource imageSourceType) async {
  try {
    final ImagePicker picker = ImagePicker();

    final XFile? xFile = imageSourceType == ImageSource.gallery
        ? await picker.pickImage(source: ImageSource.gallery)
        : await picker.pickImage(source: ImageSource.camera);

    if (xFile == null) {
      return null;
    }

    return xFile;
  } catch (e) {
    return null;
  }
}

Future<XFile?> imagePickerGallery() async {
  final ImageSource imageSource = ImageSource.gallery;

  return await imagePicker(imageSource);
}

Future<XFile?> imagePickerCamera() async {
  final ImageSource imageSource = ImageSource.camera;

  return await imagePicker(imageSource);
}
