import 'package:flutter/material.dart';

class LoginButtonCard extends StatelessWidget {
  LoginButtonCard({
    @required this.colour,
    this.cardChild,
  });
  final Color colour;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336,
      height: 66,
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
