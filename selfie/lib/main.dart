import 'package:flutter/material.dart';
import 'package:selfie/form_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Take a Selfie',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: FormView(),
    );
  }
}
