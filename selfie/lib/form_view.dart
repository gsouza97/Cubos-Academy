import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:selfie/camera_view.dart';

class FormView extends StatefulWidget {
  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final _formKey = GlobalKey<FormState>();

  String name;
  String surname;

  _showCamera() async {
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Container(
          height: size.height * 0.4,
          width: size.width * 0.75,
          child: Card(
            elevation: 15,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Name',
                      ),
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please fill in this field with your name';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        hintText: 'Last Name',
                      ),
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please fill in this field with your last name';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        surname = value;
                      },
                      onFieldSubmitted: (value) {
                        final isValid = _formKey.currentState
                            .validate(); // Valida os campos do formulário
                        if (isValid) {
                          _showCamera();
                        }
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          final isValid = _formKey.currentState
                              .validate(); // Valida os campos do formulário
                          if (isValid) {
                            _showCamera();
                          }
                        },
                        child: Text('Next'))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
