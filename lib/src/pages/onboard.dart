import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locally/src/buttons/buttons_log.dart';
import 'package:flutter/material.dart';
import 'package:locally/src/strings/text_styles.dart';

class OnBoarding extends StatelessWidget {
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: Container(
                  child: Image(
                    image: AssetImage("assets/images/directions-colour.png"),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "¡Listo!, Descubre cultura, comercio y ocio ",
                            style: signInMail,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "cerca de ti",
                              style: signInMailBlue,
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              FontAwesomeIcons.locationArrow,
                              color: Color(0xff6969ff),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                          ),
                          child: Text(
                            "Prender tu ubicación nos ayudará a darte mejores recomendaciones.",
                            style: normalTextStyle,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              openLocationSettings,
            ],
          ),
        ],
      ),
    );
  }
}
