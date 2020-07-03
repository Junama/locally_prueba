import 'package:flutter/material.dart';
import 'package:locally/src/pages/menu/calendar_page.dart';
import 'package:locally/src/pages/main_page.dart';
import 'package:locally/src/pages/sign_in_pages/first_page.dart';
import 'package:locally/src/pages/menu/home_page.dart';
import 'package:locally/src/pages/sign_in_pages/second_page.dart';
import 'package:locally/src/pages/sign_up_pages/sign_up_step1.dart';
import 'package:locally/src/pages/sign_up_pages/sign_up_step2.dart';
import 'package:locally/src/pages/sign_up_pages/sign_up_step3.dart';

Map<String, Function> routes = <String, Function>{
  '/': () => PageRouteBuilder(
  pageBuilder: (context, animation, secondaryAnimation) {
    return LoginPage();
  },
), 
  
  '/login_page': () => PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return SignInPage();
    },
  ),

 '/sign_in_page': () => PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return SignUpEmail();
    },
  ),
 
 '/sign_in_pass': () => PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return SignUpPass();
    },
  ),
  
 '/sign_in_name': () => PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return SignUpName();
    },
  ),
  '/sign_up': () => PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return HomePage();
    },
  ),
   '/calendar': () => PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return CalendarPage();
    },
  ),
   '/main': () => PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return MainPage();
    },
  ),
};