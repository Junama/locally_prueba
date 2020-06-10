import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:locally/src/pages/second_page.dart';
import 'package:locally/src/pages/sign_up_step1.dart';
import 'package:locally/src/strings/text_styles.dart';

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
                        _textCreate(context),
                        _loginMail(context),
                        _loginFacebook(context),
                        _loginGoogle(context),
                        _loginText(context),
                        _textTerms(context),
                      ],
                    ),
              ],
          ),
        );
 }
}

Widget _textCreate(BuildContext context) {

  final _screen = MediaQuery.of(context).padding;
 
  return Container(
       margin: EdgeInsets.only(top: _screen.top + 110, bottom: 20),
        child: Center(
          child: Text("Crear una cuenta.", style: normalTextStyle),
        ),
      );
}

Widget _loginMail(BuildContext context) {
 
  final _screenSize = MediaQuery.of(context).size;
 
  return Container(
    width: _screenSize.width -25,
    height: 67,
    margin: EdgeInsets.only( top: 10, bottom: 10 ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: const Color(0xff6969ff)),
    child: FlatButton(
      onPressed: () {
        Navigator.push(context,
                       MaterialPageRoute(builder: (context) => SignUpEmail()));
      },
      child: Stack(
        children: <Widget>[
          Center(child: Text("Continuar con e-mail", style: emailTextStyle)),
          PositionedDirectional(
             top: 25,
             start: 10,
              child: Container(
                   width: 24,
                   height: 18,
                   decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage("assets/drawable/mail.png"),
                        fit: BoxFit.cover),
                  ),
                ),
          ),
        ],
      ),
    ),
  );
}

Widget _loginFacebook(BuildContext context) {

  final _screenSize = MediaQuery.of(context).size;

  return Container(
    width: _screenSize.width -25,
    height: 67,
    margin: EdgeInsets.only(top: 10, bottom: 10 ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: const Color(0xff1e599b)),
     child: FlatButton(
       onPressed: () {},
       child: Stack(
         children: <Widget>[
          Center(child: Text("Continuar con Facebook", style: emailTextStyle)),
          PositionedDirectional(
           top: 19,
           start: 15,
            child: Container(
              width: 14,
              height: 29,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage("assets/drawable/facebook.png"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _loginGoogle(BuildContext context) {
  
  final _screenSize = MediaQuery.of(context).size;

  return Container(
    width: _screenSize.width -25,
    height: 67,
    margin: EdgeInsets.only(top: 10 ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: const Color(0xffd0caca)),
    child: FlatButton(
      onPressed: () {},
      child: Stack(
        children: <Widget>[
          Center(child: Text("Continuar con Google", style: emailTextStyle)),
          PositionedDirectional(
           top: 19,
           start: 11,
            child: Container(
              width: 30,
              height: 29,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage("assets/drawable/google_icon.png"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _loginText(BuildContext context) {
  
  final _screen = MediaQuery.of(context).padding;

  return Stack(
    children: <Widget>[
      Container(
          margin: EdgeInsets.only(top: _screen.top - 5),
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

Widget _textTerms(BuildContext context) {

   final _screen = MediaQuery.of(context).padding;

  return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.only( top: _screen.top + 10 ),
                  child: Text("Ya tienes una cuenta?", style: normalTextStyle),
                ),
              ),
              Container(
                  margin: EdgeInsets.only( top: 10, bottom: _screen.bottom + 10 ),
                  child: GestureDetector(
                    child: Text("sign in.", style: textButton),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignInPage()));
                    },
                  )
                ),
            ],
          );
}