import 'package:flutter/material.dart';
import './mini_container.dart';
import './top_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          TopContainer(
            margem: EdgeInsets.symmetric(vertical: 65),
          ),
          TopContainer(
            margem: EdgeInsets.only(bottom: 65),
          ),
          TopContainer(),
          Expanded(
            child: Container(),
          ),
          Container(
            color: Colors.blue,
            width: double.infinity,
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MiniContainer(cor: Colors.green),
                MiniContainer(cor: Colors.yellow),
                MiniContainer(cor: Colors.red)
              ],
            ),
          )
        ],
      ),
    );
  }
}
