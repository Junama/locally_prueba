import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:locally/src/users_preference/preferences_users.dart';

class UsersProvider {

  //ApiKey firebase
  final String _firebaseToken = "AIzaSyDkHFi_Ih5t_U9qtjg5Zkg_340WGc9IHtM";
  final _prefs = new UsersPreference(); 

  Future<Map<String, dynamic>> singUpUsers(String email, String password) async{

     final authData = {
      "email"    : email,
      "password" : password,
      "returnSecureToken" : true, 
    };

    //Peticion
    final resp = await http.post(
      "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken",
      body: json.encode( authData ),
    );
     
     Map<String,dynamic> decodeResp = json.decode( resp.body );

     print(decodeResp);

     if ( decodeResp.containsKey("idToken")){

      //Grabamos las preferencias en el dispositivo
      _prefs.token = decodeResp["idToken"];
      
       //Consultar el token en el storage     
      return{ "ok": true, "token":decodeResp["idToken"]};

     }else{
        return{ "ok": false, "mensaje":decodeResp["error"]["message"] };
     }
  }

  Future<Map<String, dynamic>> newUser( String email, String password )async{

    final authData = {
      "email"    : email,
      "password" : password,
      "returnSecureToken" : true, 
    };
    
    //Peticion
    final resp = await http.post(
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken",
      body: json.encode( authData ),
    );
     
     Map<String,dynamic> decodeResp = json.decode( resp.body );

     print(decodeResp);

     if ( decodeResp.containsKey("idToken")){

      //Grabamos las preferencias en el dispositivo
      _prefs.token = decodeResp["idToken"];

       //Salvar el token en el storage     
      return{ "ok": true, "token":decodeResp["idToken"]};

     }else{
        return{ "ok": false, "mensaje":decodeResp["error"]["message"] };
     }
  }
}