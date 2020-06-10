import 'package:flutter/material.dart';
import 'package:locally/src/blocs/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locally/src/strings/text_styles.dart';


class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 
    final bloc = Provider.of(context);

    return Scaffold(
       body: Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Column(
            children: <Widget>[
              _loginFacebook(),
              _loginGoogle(),
            ],
          ),
          SizedBox(height: 20),
          Text("Or", style: normalTextStyle),
          SizedBox(height: 20),
          Column(
            children: <Widget>[
              _logEmail(bloc),
              _logPassword(bloc),
              SizedBox(
                height: 20,
              ),
              _logText(),
              SizedBox(
                height: 20,
              ),
              _buttonSignIn(bloc),
            ],
          ),
        ],
      ),
    ));
  }
}

Widget _loginFacebook() {
  return Container(
    width: 336,
    height: 66,
    margin: EdgeInsets.only(
      top: 20.0,
      bottom: 0.0,
    ),
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

Widget _logEmail(LoginBloc bloc) {
  return StreamBuilder(
    stream: bloc.emailStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Stack(
        children: <Widget>[
          Container(
            width: 333,
            height: 64,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(2)),
                color: const Color(0xfff0f0f0)),
            child: Stack(children: <Widget>[
              PositionedDirectional(
                top: 10,
                start: 25,
                child: Container(
                  width: 340,
                  height: 55,
                  child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: const Color(0xfff0f0f0))),
                      hintText: "E-mail",
                      hintStyle: TextStyle(
                          color: Color(0xff989898),
                          fontWeight: FontWeight.w600,
                          fontFamily: "SFProText",
                          fontStyle: FontStyle.normal,
                          fontSize: 18.0),
                      errorText: snapshot.error,
                    ),
                    style: TextStyle(
                        color: Color(0xff989898),
                        fontWeight: FontWeight.w600,
                        fontFamily: "SFProText",
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => bloc.changeEmail(value),
                  ),
                ),
              ),
            ]),
          ),
        ],
      );
    },
  );
}

Widget _logPassword(LoginBloc bloc) {
  return StreamBuilder(
    stream: bloc.passwordStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Stack(
        children: <Widget>[
          Container(
            width: 333,
            height: 64,
            margin: EdgeInsets.only(),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(2)),
                color: const Color(0xfff0f0f0)),
            child: Stack(children: <Widget>[
              PositionedDirectional(
                top: 10,
                start: 25,
                child: Container(
                    width: 280,
                    height: 54,
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: const Color(0xfff0f0f0))),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Color(0xff989898),
                          fontWeight: FontWeight.w600,
                          fontFamily: "SFProText",
                          fontStyle: FontStyle.normal,
                          fontSize: 18.0,
                        ),
                        errorText: snapshot.error,
                      ),
                      style: TextStyle(
                          color: Color(0xff989898),
                          fontWeight: FontWeight.w600,
                          fontFamily: "SFProText",
                          fontStyle: FontStyle.normal,
                          fontSize: 18.0),
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (value) => bloc.changePassword(value),
                      obscureText: true,
                    )),
              )
            ]),
          ),
        ],
      );
    },
  );
}

Widget _logText() {
  return Container(
      child: GestureDetector(
    child: Text("olvidaste tu contraseña?",
        style: textButton, textAlign: TextAlign.center),
    onTap: () {},
    /*Navigator.push(context,
                       MaterialPageRoute(builder: (context) => SignInPage()));
             },*/
  ));
}

Widget _buttonSignIn(LoginBloc bloc) {
  return StreamBuilder(
    stream: bloc.formValidStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Stack(
        children: <Widget>[
          Container(
            width: 336,
            height: 71,
            margin: EdgeInsets.only(bottom: 30.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: RaisedButton(
              child: Text("sign in.",
                  style: const TextStyle(
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                      fontFamily: "SFProText",
                      fontStyle: FontStyle.normal,
                      fontSize: 21.0)),
              onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
              color: const Color(0xff6969ff),
            ),
          ),
        ],
      );
    },
  );
}

_login(LoginBloc bloc, BuildContext context) {
  print("================");
  print("Email: ${bloc.email} ");
  print("Password: ${bloc.password}");
  print("================");

  //Navigator.pushReplacementNamed(context, routeName);
}
