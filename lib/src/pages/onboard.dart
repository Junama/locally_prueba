import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locally/src/utils/buttons_log.dart';
import 'package:flutter/material.dart';
import 'package:locally/src/utils/text_styles.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _screenSize    = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: _screenSize.height / 3,
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
                    height: _screenSize.height / 3,
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
                            child: Text("¡Listo!, Descubre cultura, comercio y ocio ",style: signInMail,
                                        textAlign: TextAlign.left,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Text("cerca de ti",style: signInMailBlue,textAlign: TextAlign.left,
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
                            child: Text("Prender tu ubicación nos ayudará a darte mejores recomendaciones.",style: normalTextStyle,
                                        textAlign: TextAlign.left,
                                   ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: openLocationSettings,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
