import 'package:flutter/material.dart';
import 'package:locally/src/strings/text_styles.dart';

import '../strings/text_styles.dart';

class FirstOnBoardPage extends StatelessWidget {
  const FirstOnBoardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            alignment: Alignment.topRight,
            child: Image(
              fit: BoxFit.fitWidth,
              image: AssetImage("assets/images/Group.png"),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 75),
                  child: Image(
                    image: AssetImage("assets/drawable/calendar_colour.png"),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 40, right: 40),
                child: Text(
                  "Descubre y revisa toda la oferta local.  Agenda eventos y compartelos con tus cercanos.",
                  style: onBoardText,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              _buttonContinue(),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buttonContinue() {
  return Center(
    child: Container(
        width: 149,
        height: 49,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            color: const Color(0xff6969ff))),
  );
}
