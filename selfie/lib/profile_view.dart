import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  final XFile picture;
  final String name;
  final String surname;

  const ProfileView({
    @required this.picture,
    @required this.name,
    @required this.surname,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: picture == null
          ? Container()
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: size.height * 0.42,
                    width: size.width * 0.5,
                    child: Image.file(
                      File(picture.path),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '$name $surname',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
