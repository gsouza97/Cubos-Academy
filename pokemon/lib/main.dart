import 'package:flutter/material.dart';
import 'package:pokemon/poke-view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poke API',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.white,
      ),
      home: PokeView(),
    );
  }
}
