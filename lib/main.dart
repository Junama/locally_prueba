
import 'package:flutter/material.dart';
import 'package:locally/src/pages/home_page.dart';
import 'package:locally/src/pages/login_page.dart';


 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: "login",
      routes: {
        //"splash": (BuildContext context) => SplashPage(),
        "login" : (BuildContext context) => LoginPage(),
        "home"  : (BuildContext context) => HomePage(),
      },
    );
  }
}

