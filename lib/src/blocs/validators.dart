

import 'dart:async';

class Validators {

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: ( email, sink ){
      
     Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
     RegExp regExp   = new RegExp(pattern);

     if ( regExp.hasMatch( email )) {
       sink.add(email);
     } else {
       sink.addError( "Ingrese un mail correcto" );
     }
    }
  );     

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: ( password, sink ){
      
      if ( password.length >=6 ) {
        sink.add( password );
      } else {
        sink.addError( "Debe contener al menos 6 caracteres" );
      }
    }
  );

  final validateName    = StreamTransformer<String, String>.fromHandlers(
    handleData: ( name, sink ){
      
      if ( name.length >= 4 ) {
        sink.add( name );
      } else {
        sink.addError( "El nombre debe tener al menos 4 caracteres" );
      }
    }
  );

}