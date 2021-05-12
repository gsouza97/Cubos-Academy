import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[700],
      appBar: AppBar(
        backgroundColor: Colors.redAccent[700],
        title: Text('Home Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('second');
                },
                child: Text('Second Screen'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('third');
                },
                child: Text('Third Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
