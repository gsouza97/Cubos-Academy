import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        color: Colors.black,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 100,
              width: 320,
              margin: EdgeInsets.symmetric(vertical: 65),
            ),
            Container(
              color: Colors.white,
              height: 100,
              width: 320,
              margin: EdgeInsets.only(bottom: 65),
            ),
            Container(
              color: Colors.white,
              height: 100,
              width: 320,
            ),
            Expanded(
              child: Container(),
            ),
            Stack(
              children: [
                Container(
                  color: Colors.blue,
                  width: double.infinity,
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.green,
                        height: 50,
                        width: 50,
                      ),
                      Container(
                        color: Colors.yellow,
                        height: 50,
                        width: 50,
                      ),
                      Container(
                        color: Colors.red,
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
