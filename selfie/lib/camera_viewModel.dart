import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:selfie/camera_model.dart';

class CameraViewModel {
  final _model = CameraModel();
  CameraController cameraController;
  Future<void> initCamera;

  selectCamera(CameraDescription camera) {
    cameraController = CameraController(camera, ResolutionPreset.max);
  }

  initializeCamera() {
    initCamera = cameraController.initialize();
  }

  takePicture(BuildContext context, String name, String surname) {
    _model.takePicture(context, name, surname, cameraController, initCamera);
  }
}
