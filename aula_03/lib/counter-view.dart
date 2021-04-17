import 'package:flutter/material.dart';
import 'package:aula_03/counter-controller.dart';
import 'package:aula_03/button.dart';

class CounterView extends StatefulWidget {
  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  final controller = CounterController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contador'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Você pressionou o botão:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                controller.getContador(),
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OperationFloatActionButton((Icons.remove), () {
              setState(() {
                controller.decrementarContador();
              });
            }),
            SizedBox(width: 10),
            OperationFloatActionButton((Icons.add), () {
              setState(() {
                controller.incrementarContador();
              });
            }),
          ],
        ),
      ),
    );
  }
}