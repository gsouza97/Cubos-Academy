import 'package:flutter/material.dart';

class MiniContainer extends StatelessWidget {
  final Color cor;
  MiniContainer({this.cor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cor,
      height: 50,
      width: 50,
    );
  }
}
