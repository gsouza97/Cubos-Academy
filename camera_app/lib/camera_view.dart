import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraView extends StatefulWidget {
  final CameraDescription camera;

  CameraView({@required this.camera});

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  // Controller para controlar a camera, tirar foto, etc
  CameraController _cameraController;
  // Variável para saber quando a camera foi inicializada
  Future<void> _initCameraFuture;

  @override
  void initState() {
    super.initState();

    // Cria o controlador passando a camera que foi passada pelo construtor e determina a resolucao
    _cameraController = CameraController(widget.camera, ResolutionPreset.max);
    // Inicializa a camera. Dá um start
    _initCameraFuture = _cameraController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          FutureBuilder(
            future: _initCameraFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_cameraController);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
