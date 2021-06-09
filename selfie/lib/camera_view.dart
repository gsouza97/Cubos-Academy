import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:selfie/camera_viewModel.dart';
import 'package:selfie/profile_view.dart';

class CameraView extends StatefulWidget {
  final CameraDescription camera;
  final String name;
  final String surname;

  CameraView(
      {@required this.camera, @required this.name, @required this.surname});

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  final viewModel = CameraViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.selectCamera(widget.camera);
    viewModel.initializeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          FutureBuilder(
            future: viewModel.initCamera,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(viewModel.cameraController);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              onPressed: () {
                viewModel.takePicture(context, widget.name, widget.surname);
              },
              child: Icon(Icons.camera),
            ),
          )
        ],
      ),
    );
  }
}
