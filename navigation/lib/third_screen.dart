import 'package:flutter/material.dart';

class Person {
  final String name;
  final int age;

  Person({this.name, this.age});
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final person = Person(name: 'Gabriel', age: 24);
    final bgColor = ModalRoute.of(context).settings.arguments as Color;
    return Scaffold(
      backgroundColor: bgColor != null ? bgColor : Colors.black,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text('Third Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: TextButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed('fourth', arguments: person);
            },
            child: Text('Fourth Screen'),
          ),
        ),
      ),
    );
  }
}
