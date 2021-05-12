import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  final Color bgColor = Colors.orange.shade500;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text('Second Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('third', arguments: bgColor);
                },
                child: Text('Third Screen'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('fourth');
                },
                child: Text('Fourth Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
