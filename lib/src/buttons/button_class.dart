import 'package:flutter/material.dart';

class LoginButtonCard extends StatelessWidget {
  LoginButtonCard(
      {this.colour, this.cardChild, this.stream, this.text, this.imageIcon});

  final Color colour;
  final Widget cardChild;
  final MaterialPageRoute stream;
  final Text text;
  final Icon imageIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 67,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)), color: colour),
      child: FlatButton(
        onPressed: () {
          Navigator.push(context, stream);
        },
        child: Stack(
          children: <Widget>[
            Center(child: text),
            Container(alignment: Alignment.centerLeft, child: imageIcon),
          ],
        ),
      ),
    );
  }
}
