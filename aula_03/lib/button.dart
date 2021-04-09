import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  IconData icone;
  void Function() funcao;

  Botao(
    this.icone,
    this.funcao,
  );

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: funcao,
      child: Icon(icone),
    );
  }
}
