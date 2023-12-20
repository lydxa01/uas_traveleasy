import 'package:flutter/material.dart';

class LText extends StatelessWidget {
  final String text;
  double size;
  final Color color;
  final TextAlign textAlign;
   LText({super.key, this.size=27,required this.text,  this.color=Colors.black,  this.textAlign = TextAlign.center,});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color:color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
      textAlign: textAlign,
    );
  }
}

class MText extends StatelessWidget {
  final String text;
  double size;
  final Color color;
  final TextAlign textAlign;
   MText({super.key, this.size=20,required this.text,  this.color=Colors.black,  this.textAlign = TextAlign.center,});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color:color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
      textAlign: textAlign,
    );
  }
}

class SText extends StatelessWidget {
  final String text;
  double size;
  final Color color;
  final TextAlign textAlign;
   SText({super.key, this.size=14,required this.text,  this.color=Colors.black,  this.textAlign = TextAlign.center,});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color:color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
      textAlign: textAlign,
    );
  }
}