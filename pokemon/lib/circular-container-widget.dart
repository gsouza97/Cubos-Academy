import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  String text;

  CircularContainer({this.text});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: size.height * 0.04,
      decoration: BoxDecoration(
        color: Color(0xffdcdcdc),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: Text(
          text, style: Theme.of(context).textTheme.subhead,
        ),
      ),
    );
  }
}
