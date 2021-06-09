import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
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
  CameraController _cameraController;
  Future<void> _initCamera;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(widget.camera, ResolutionPreset.max);
    _initCamera = _cameraController.initialize();
  }

  _takePicture(BuildContext context) async {
    await _initCamera;
    final picture = await _cameraController.takePicture();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProfileView(
          picture: picture,
          name: widget.name,
          surname: widget.surname,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          FutureBuilder(
            future: _initCamera,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_cameraController);
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
                _takePicture(context);
              },
              child: Icon(Icons.camera),
            ),
          )
        ],
      ),
    );
  }
}
