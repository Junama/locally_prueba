
import 'package:flutter/material.dart';
import 'package:locally/src/blocs/provider.dart';
import 'package:locally/src/pages/first_page.dart';
import 'package:locally/src/pages/second_page.dart';
import 'package:locally/src/pages/sign_up_step1.dart';
import 'package:locally/src/pages/sign_up_step2.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Provider(
      child:MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'Material App',
       initialRoute: "login",
       routes: {
        //"splash": (BuildContext context) => SplashPage(),
         "login"         : (BuildContext context) => LoginPage(),
         "sign_in"       : (BuildContext context) => SignInPage(),
         "sign_up_mail"  : (BuildContext context) => SignUpEmail(),
         "sign_up_pass"  : (BuildContext context) => SignUpPass(),
       },
      ), 
    );
  }
}

