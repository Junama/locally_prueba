import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {

  TextBox({@required this.text, this.textStyle, this.gesture});

  final TextStyle textStyle;
  final String text;
  final MaterialPageRoute gesture;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, gesture);
        },
        child: Text(
          text,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
