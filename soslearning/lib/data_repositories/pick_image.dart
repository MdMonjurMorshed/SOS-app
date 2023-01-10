import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageRepository {
  File? fileImage;
  File? tookImage;
  Future pickImageFrom() async {
    final fromgallery =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (fromgallery == null) return;
    final temp_galary = File(fromgallery.path);
    print(temp_galary.toString());
    fileImage = temp_galary;
  }

  Future takeImage() async {
    final fromcamera =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (fromcamera == null) return;
    final temp_camera = File(fromcamera.path);
    tookImage = temp_camera;
  }
}
