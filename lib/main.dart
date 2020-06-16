
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:locally/src/blocs/provider.dart';
import 'package:locally/src/routes/routes.dart';
import 'package:locally/src/users_preference/preferences_users.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized(); 
 
  final prefs = new UsersPreference();
  await prefs.initPrefs();

  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   
   SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,]);

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

