import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:selfie/profile_view.dart';

class CameraModel {
  Future<void> takePicture(BuildContext context, String name, String surname,
      CameraController cameraController, Future<void> initCamera) async {
    await initCamera;
    final picture = await cameraController.takePicture();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProfileView(
          picture: picture,
          name: name,
          surname: surname,
        ),
      ),
    );
  }
}
