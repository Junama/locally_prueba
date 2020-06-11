import 'package:flutter/material.dart';
import 'package:locally/src/buttons/buttons_log.dart';
import 'package:locally/src/pages/second_page.dart';
import 'package:locally/src/strings/text_styles.dart';
import 'package:locally/src/strings/text_box.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(child: Text("Crear una cuenta.", style: normalTextStyle)),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              emailLoginButton,
              facebookLoginButton,
              googleLoginButton,
              TextBox(
                text:"al crear una cuenta aceptas nuestros terminos y condiciones",
                textStyle: normalTextStyle,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              TextBox(
                text: "¿Ya tienes una cuenta?",
                textStyle: normalTextStyle,
              ),
              TextBox(
                text: "Sign in",
                textStyle: textButton,
                gesture:MaterialPageRoute(builder: (context) => SignInPage()),
              ),
            ],
          ),
        ],
     ),
    );
  }
}