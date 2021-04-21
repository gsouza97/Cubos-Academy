import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  final String text;

  CircularContainer({@required this.text});

  final config = {
    'Water': {'color': Colors.lightBlue, 'textColor': Colors.white},
    'Electric': {'color': Colors.amberAccent, 'textColor': Colors.white},
    'Psychic': {'color': Colors.purple, 'textColor': Colors.white},
    'Poison': {'color': Colors.deepPurple, 'textColor': Colors.white},
    'Rock': {'color': Colors.grey, 'textColor': Colors.white},
    'Fire': {'color': Colors.redAccent, 'textColor': Colors.white},
    'Grass': {'color': Colors.green, 'textColor': Colors.white},
    'Fighting': {'color': Colors.grey[600], 'textColor': Colors.white},
    'Bug': {'color': Colors.amber[700], 'textColor': Colors.white},
  };

  Color get color =>
      config[text] != null ? config[text]['color'] : Color(0xffdcdcdc);

  Color get textColor =>
      config[text] != null ? config[text]['textColor'] : Color(0xff838383);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: size.height * 0.04,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
