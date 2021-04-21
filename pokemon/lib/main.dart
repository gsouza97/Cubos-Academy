import 'package:flutter/material.dart';
import 'package:pokemon/poke-view.dart';
import 'package:pokemon/poke-new-view.dart';

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
        primaryColor: Colors.white,
        accentColor: Color(0xff00bcd5),
        textTheme: TextTheme(
          title: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: Colors.black.withOpacity(0.75),
          ),
          subtitle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: Color(0xff838383),
          ),
          subhead: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: Color(0xff838383),
          ),
        ),
      ),
      home: PokeNewView(),
    );
  }
}
