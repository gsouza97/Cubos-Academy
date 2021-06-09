import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'camera_view.dart';

class FormModel {
  String name;
  String surname;
  

  Future<void> showCamera(BuildContext context) async {
    final cameras = await availableCameras();
    final camera = cameras.firstWhere(
        (element) => element.lensDirection == CameraLensDirection.front);
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CameraView(
          camera: camera,
          name: name,
          surname: surname,
        ),
      ),
    );
  }
}
