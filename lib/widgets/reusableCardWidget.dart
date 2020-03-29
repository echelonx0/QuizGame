import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Text label;
  final Text label2;
  final icon;
  final iconColor;
  ReusableCard ({this.color, this.label, this.icon, this.iconColor, this.label2});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(icon, size: 25, color: iconColor,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: label,
            ),
            label2,
          ],
        ),
      ),
    );
  }
}