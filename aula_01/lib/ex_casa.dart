import 'package:flutter/material.dart';

class ExCasa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: Stack(
          children: [
            Container(
              color: Colors.green,
              height: 180,
              width: 180,
            ),
            Positioned(
              top: 180,
              child: Container(
                color: Colors.orange[300],
                height: 180,
                width: 180,
              ),
            ),
            Positioned(
              top: 360,
              child: Container(
                color: Colors.pink,
                height: 90,
                width: 270,
              ),
            ),
            Positioned(
              top: 450,
              child: Container(
                color: Colors.blue,
                height: 90,
                width: 360,
              ),
            ),
            Positioned(
              left: 180,
              child: Container(
                color: Colors.blue,
                height: 90,
                width: 180,
              ),
            ),
            Positioned(
              top: 90,
              left: 180,
              child: Container(
                color: Colors.brown,
                width: 90,
                height: 270,
              ),
            ),
            Positioned(
              top: 90,
              left: 270,
              child: Container(
                color: Colors.yellow,
                width: 90,
                height: 270,
              ),
            ),
            Positioned(
              top: 360,
              left: 270,
              child: Container(
                color: Colors.purple,
                width: 90,
                height: 90,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
