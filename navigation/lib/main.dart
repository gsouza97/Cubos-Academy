import 'package:flutter/material.dart';
import 'package:navigation/home_screen.dart';
import 'package:navigation/fourth_screen.dart';
import 'package:navigation/second_screen.dart';
import 'package:navigation/third_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        'second': (context) => SecondScreen(),
        'third': (context) => ThirdScreen(),
        'fourth': (context) => FourthScreen(),
      },
    );
  }
}
