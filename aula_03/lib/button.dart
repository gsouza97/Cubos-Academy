import 'package:flutter/material.dart';

class OperationFloatActionButton extends StatelessWidget {
  IconData icone;
  void Function() funcao;

  OperationFloatActionButton(
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
