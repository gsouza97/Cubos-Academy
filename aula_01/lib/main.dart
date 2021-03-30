import 'package:aula_01/ex_casa.dart';
import 'package:aula_01/ex_sala.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExSala(),
      //ExSala()
    );
  }
}
