import 'package:flutter/material.dart';
import 'text_styles.dart';

class ButtonContent extends StatelessWidget {
  ButtonContent({
    this.buttonIcon,
    this.buttonText,
  });
  final IconData buttonIcon;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          buttonIcon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          buttonText,
          style: googleTextStyle,
        )
      ],
    );
  }
}
