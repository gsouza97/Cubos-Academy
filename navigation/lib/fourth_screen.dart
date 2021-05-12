import 'package:flutter/material.dart';
import 'package:navigation/third_screen.dart';

class FourthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final person = ModalRoute.of(context).settings.arguments as Person;
    return Scaffold(
      appBar: AppBar(
        title: Text('Fourth Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              person != null ? Text('Name: ${person.name}') : Text(''),
              person != null ? Text('Age: ${person.age}') : Text(''),
              TextButton(
                onPressed: () {
                  Navigator.of(context).popUntil(ModalRoute.withName('/'));
                },
                child: Text('Home Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
