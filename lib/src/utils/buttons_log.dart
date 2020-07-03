import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locally/src/utils/button_class.dart';
import 'package:locally/src/pages/sign_up_pages/onboard_page.dart';
import 'package:locally/src/utils/text_styles.dart';
import '../pages/sign_up_pages/onboard.dart';


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
    imageIcon: Icon(FontAwesomeIcons.facebook, color: Colors.white),
    colour: Color(0xff1e599b),
    stream: MaterialPageRoute(builder: (context) => OnBoarding())
);

final openLocationSettings = LoginButtonCard(
    text: Text(
      "Open location settings",
      style: emailTextStyle,
    ),
    colour: Color(0xff6969ff),
    stream: MaterialPageRoute(builder: (context) => OnboardingScreen())
);
