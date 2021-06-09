import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  final XFile picture;
  final String name;
  final String surname;

  const ProfileView(
      {@required this.picture, @required this.name, @required this.surname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: picture == null
          ? Container()
          : Container(
              width: double.infinity,
              height: 400,
              child: Image.file(
                File(picture.path),
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}
