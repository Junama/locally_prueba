import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:locally/src/blocs/provider.dart';
import 'package:locally/src/pages/on_board1.dart';
import 'package:locally/src/pages/onboard.dart';
import 'package:locally/src/strings/text_styles.dart';

import '../strings/text_styles.dart';

class SignUpName extends StatefulWidget {
  @override
  _SignUpNameState createState() => _SignUpNameState();
}

class _SignUpNameState extends State<SignUpName> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Color(0xff6969ff)),
          title: Text("Registrate", style: normalTextStyle),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20),
              width: double.infinity,
              child: Text(
                "Ingresa nombre completo",
                textAlign: TextAlign.left,
                style: signInMailBlue,
              ),
            ),
            _name(bloc),
            _stepText(),
            _loading(),
            _buttonSignIn(bloc, context),
          ],
        ));
  }
}

Widget _name(LoginBloc bloc) {
  return Container(
    margin: EdgeInsets.all(20),
    child: StreamBuilder(
      //stream: bloc.validateName,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            hintText: "Nombre",
            hintStyle: normalTextStyle,
            errorText: snapshot.error,
          ),
          style: normalTextStyle,
          keyboardType: TextInputType.text,
          //onChanged: (value) => bloc.changeName(value),
        );
      },
    ),
  );
}

Widget _stepText() {
  return Stack(children: <Widget>[
    Container(
        width: 84, height: 45, child: Text("Paso 3/3", style: normalTextStyle)),
  ]);
}

Widget _loading() {
  return Opacity(
    opacity: 0.800000011920929,
    child: Container(
        width: 285,
        height: 7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: const Color(0xffd4d4d4),
        ),
        child: Container(
          width: 95,
          height: 7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: const Color(0xff6969ff)),
          child: LinearProgressIndicator(
            backgroundColor: Color(0xffd4d4d4),
            value: 1,
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xff6969ff)),
          ),
        )),
  );
}

Widget _buttonSignIn(LoginBloc bloc, BuildContext context) {
  return StreamBuilder(
    stream: bloc.passwordStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        margin: EdgeInsets.only(bottom: 30, left: 20, right: 20, top: 20),
        width: double.infinity,
        height: 67,
        child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          disabledColor: Colors.grey[300],
          child: Text("Sign up!", style: normalWhiteTextStyle),
          onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
          color: Color(0xff6969ff),
        ),
      );
    },
  );
}

_login(LoginBloc bloc, BuildContext context) {
  print("================");
  print("Password: ${bloc.password} ");

  Navigator.push(
      context, MaterialPageRoute(builder: (context) => OnBoarding()));
}
