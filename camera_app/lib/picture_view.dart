import 'package:camera/camera.dart';
import 'package:camera_app/camera_view.dart';
import 'package:flutter/material.dart';

class PictureView extends StatefulWidget {
  const PictureView({Key key}) : super(key: key);

  @override
  _PictureViewState createState() => _PictureViewState();
}

class _PictureViewState extends State<PictureView> {
  // Função para mostrar a camera.
  // Primeiramente tem que pegar as cameras que estão disponíveis no aparelho
  // Em seguida escolhe uma das cameras
  // Depois abre uma tela mostrando a camera.
  _showCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;

    final result = Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CameraView(camera: camera,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Take a self clicking on the button below'),
            ElevatedButton(
              onPressed: () {
                _showCamera();
              },
              child: Text('Open Camera'),
            )
          ],
        ),
      ),
    );
  }
}
