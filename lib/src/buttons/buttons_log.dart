
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locally/src/buttons/button_class.dart';
import 'package:locally/src/pages/sign_up_step1.dart';
import 'package:locally/src/strings/text_styles.dart';

final googleLoginButton = LoginButtonCard(
  text: Text(
    "continue with Google",
    style: facebookTextStyle,
  ),
  imageIcon: Icon(FontAwesomeIcons.google, color: Colors.white),
  colour: Color(0xffd0caca),
);

final facebookLoginButton = LoginButtonCard(
  text: Text(
    "continue with Facebook",
    style: facebookTextStyle,
  ),
  imageIcon: Icon(FontAwesomeIcons.facebookF, color: Colors.white),
  colour: Color(0xff1e599b),
);

final emailLoginButton = LoginButtonCard(
    imageIcon: Icon(FontAwesomeIcons.mailBulk, color: Colors.white),
    text: Text(
      "continue with Email",
      style: emailTextStyle,
    ),
    colour: Color(0xff6969ff),
    stream: MaterialPageRoute(builder: (context) => SignUpEmail()));
