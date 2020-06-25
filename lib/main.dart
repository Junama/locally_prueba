
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:locally/src/blocs/provider.dart';
import 'package:locally/src/pages/first_page.dart';
import 'package:locally/src/pages/home_page.dart';
import 'package:locally/src/routes/routes.dart';
import 'package:locally/src/users_preference/preferences_users.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized(); 
 
  final prefs = new UsersPreference();
  await prefs.initPrefs();

  runApp(MyApp());
}
 
class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isLoggedIn = false;
  
  @override
  Widget build(BuildContext context) {
   
   SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,]);
   
   final prefs = new UsersPreference();

    return Provider(
      child:MaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'Material App',
       home: prefs.token == null ? LoginPage() : HomePage(),
      // initialRoute: "/",
       onGenerateRoute: ( settings ) {
         if (routes.containsKey(settings.name)){
           return routes[settings.name]();
         }
         return routes["/unknwon-route"]();
       },     
      ), 
    );
  }
}

