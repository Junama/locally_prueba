
import 'package:flutter/material.dart';
import 'package:locally/src/blocs/provider.dart';
import 'package:locally/src/routes/routes.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Provider(
      child:MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'Material App',
       initialRoute: "/",
       onGenerateRoute:  ( settings ) {
         if (routes.containsKey(settings.name)){
           return routes[settings.name]();
         }
         return routes["/unknwon-route"]();
       },
       
       /*routes: {
        //"splash": (BuildContext context) => SplashPage(),
         "login"         : (BuildContext context) => LoginPage(),
       },*/
      ), 
    );
  }
}

