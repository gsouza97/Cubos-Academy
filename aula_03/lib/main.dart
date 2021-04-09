import 'package:aula_03/button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int contagem = 0;

  void add() {
    setState(() {
      contagem++;
    });
  }

  void sub() {
    setState(() {
      if (contagem > 0) {
        contagem--;
      }
    });
  }

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
                '$contagem',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Botao((Icons.remove), sub),
            SizedBox(width: 10),
            Botao((Icons.add), add),
          ],
        ),
      ),
    );
  }
}
