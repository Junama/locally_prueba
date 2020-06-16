import 'package:flutter/material.dart';
import 'package:locally/src/blocs/provider.dart';
import 'package:locally/src/pages/inicio_page.dart';
import 'package:locally/src/pages/sign_up_step2.dart';
import 'package:locally/src/providers/users_provider.dart';
import 'package:locally/src/utils/buttons_log.dart';
import 'package:locally/src/utils/text_styles.dart';
import 'package:locally/src/utils/text_box.dart';
import 'package:locally/src/utils/utils.dart';

class SignInPage extends StatelessWidget {
  
  final userLoginProvider = new UsersProvider();

  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
            leading: BackButton(color: Colors.black),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              "Welcome back",
              style: normalTextStyle,
              textAlign: TextAlign.center,
            )
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    facebookLoginButton,
                    googleLoginButton,
                  ],
                ),
                TextBox(text: "Or", textStyle: normalTextStyle),
                Column(
                  children: <Widget>[
                    _logEmail(bloc, context),
                    _logPassword(bloc),
                  ],
                ),
                TextBox(
                  text: "¿olvidaste tu contraseña?",
                  textStyle: buttonLink,
                ),
                _buttonSignIn(bloc, context),
              ],
            ),
          ),
        )
    );
  }


Widget _logEmail(LoginBloc bloc, BuildContext context) {
  return Container(
    height: 67,
    child: StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            hintText: "Email",
            hintStyle: textButtonGrey,
            errorText: snapshot.error,
          ),
          style: textButtonGrey,
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) => bloc.changeEmail(value),
        );
      },
    ),
  );
}

Widget _logPassword(LoginBloc bloc) {
  return Container(
    height: 67,
    child: StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            hintText: "Password",
            hintStyle: textButtonGrey,
            errorText: snapshot.error,
          ),
          style: textButtonGrey,
          keyboardType: TextInputType.visiblePassword,
          onChanged: (value) => bloc.changePassword(value),
          obscureText: true,
        );
      },
    ),
  );
}

Widget _buttonSignIn(LoginBloc bloc, BuildContext context) {
  return StreamBuilder(
    stream: bloc.formValidStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        margin: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        height: 67,
        child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          disabledColor: Colors.grey[300],
          child: Text("sign in.", style: buttonSignIn),
          onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
          color: Color(0xff6969ff),
        ),
      );
    },
  );
}

_login(LoginBloc bloc, BuildContext context) async{
  
  Map info = await userLoginProvider.singUpUsers(bloc.email, bloc.password);

   if ( info["ok"] ) {
   
   Navigator.push(context, MaterialPageRoute(builder: (context) => Inicio()));

   }else{
     showAlert(context, "Mail o contraseña incorrectos");
   }

 }
}