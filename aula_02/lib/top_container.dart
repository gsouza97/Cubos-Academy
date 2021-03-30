import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  final Color cor;
  final EdgeInsetsGeometry margem;

  TopContainer({this.cor = Colors.white, this.margem});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cor,
      height: 100,
      width: 320,
      margin: margem
    );
  }
}
