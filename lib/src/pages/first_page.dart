import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:locally/src/pages/sign_in_page.dart';
import 'package:locally/src/pages/sign_up_email1.dart';
import 'text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 150.0, bottom: 10),
              child: Center(
                child: Text("Crear una cuenta.", style: normalTextStyle),
              ),
            ),
            _loginMail(context),
            _loginFacebook(),
            _loginGoogle(),
            _loginText(context),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 45),
                child: Text("Ya tienes una cuenta?", style: normalTextStyle),
              ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 114),
                child: GestureDetector(
                  child: Text("sign in.", style: textButton),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignInPage()));
                  },
                )),
          ],
        )
      ],
    ));
  }
}

Widget _loginMail(BuildContext context) {
  return Container(
    width: 336,
    height: 66,
    margin: EdgeInsets.only(top: 20.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: const Color(0xff6969ff)),
    child: FlatButton(
      onPressed: () {},
      child: Stack(
        children: <Widget>[
          Center(child: Text("Continuar con e-mail", style: emailTextStyle)),
          Container(
            alignment: Alignment.centerRight,
            child: Icon(
              FontAwesomeIcons.mailBulk,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _loginFacebook() {
  return Container(
    width: 336,
    height: 66,
    margin: EdgeInsets.only(top: 20.0, bottom: 0.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: const Color(0xff1e599b)),
    child: FlatButton(
      onPressed: () {},
      child: Stack(
        children: <Widget>[
          Center(child: Text("Continuar con Facebook", style: emailTextStyle)),
          Container(
            alignment: Alignment.centerRight,
            child: Icon(
              FontAwesomeIcons.facebookF,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _loginGoogle() {
  return Container(
    width: 336,
    height: 66,
    margin: EdgeInsets.only(top: 20.0, bottom: 0.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: const Color(0xffd0caca)),
    child: FlatButton(
      onPressed: () {},
      child: Stack(
        children: <Widget>[
          Center(child: Text("Continuar con Google", style: emailTextStyle)),
          Container(
            alignment: Alignment.centerRight,
            child: Icon(
              FontAwesomeIcons.google,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _loginText(BuildContext context) {
  return Stack(
    children: <Widget>[
      Container(
          margin: EdgeInsets.only(
            top: 25.0,
          ),
          child: Text.rich(
              TextSpan(
                  text: "al crear una cuenta aceptas nuestros ",
                  style: normalTextStyle,
                  children: <TextSpan>[
                    TextSpan(
                        text: "terminos y condiciones.", style: textButtonGrey)
                  ]),
              textAlign: TextAlign.center)),
    ],
  );
}
