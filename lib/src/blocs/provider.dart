import 'package:flutter/material.dart';
import 'package:locally/src/blocs/login_bloc.dart';
export 'package:locally/src/blocs/login_bloc.dart';

//Manejamos multiples instancias de Bloc
class Provider extends InheritedWidget {

  static Provider _instancia;

  factory Provider({ Key key, Widget child }){

    if ( _instancia ==  null ) {
      _instancia = new Provider._internal(key: key, child: child);
    }

    return _instancia;
  }

  Provider._internal({ Key key, Widget child })
   : super( key: key, child: child );

  final loginBloc = LoginBloc();

  //Provider({ Key key, Widget child })
  // : super( key: key, child: child );

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of ( BuildContext context ) {

    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
    //Tomamos el contexto del arbol de Widgets. Busca el provider

  }


}