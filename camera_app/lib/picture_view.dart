import 'dart:io';

import 'package:camera/camera.dart';
import 'package:camera_app/camera_view.dart';
import 'package:flutter/material.dart';

class PictureView extends StatefulWidget {
  const PictureView({Key key}) : super(key: key);

  @override
  _PictureViewState createState() => _PictureViewState();
}

class _PictureViewState extends State<PictureView> {
  // Variável que recebe a foto do pop
  XFile _picture;

  // Função para mostrar a camera.
  // Primeiramente tem que pegar as cameras que estão disponíveis no aparelho
  // Em seguida escolhe uma das cameras
  // Depois abre uma tela mostrando a camera.
  // Pega a foto que foi tirada e salva em _picture. SetState pra exibir
  _showCamera() async {
    final cameras = await availableCameras();
    // Pegando a camera frontal
    final camera = cameras.firstWhere((element) => element.lensDirection == CameraLensDirection.front);
    //final camera = cameras.first;

    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CameraView(
          camera: camera,
        ),
      ),
    );
    setState(() {
      _picture = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Take a self clicking on the button below'),
              ElevatedButton(
                onPressed: () {
                  _showCamera();
                },
                child: Text('Open Camera'),
              ),
              SizedBox(height: 30),
              _picture != null
                  ? Container(
                      width: double.infinity,
                      height: 400,
                      child: Image.file(
                        File(_picture.path),
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
