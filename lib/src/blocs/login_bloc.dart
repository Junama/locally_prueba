import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:locally/src/blocs/validators.dart';

class LoginBloc with Validators {

                            //StreamController<String>.broadcast(), es lo mismo, pero no lo trae el rxdart. El broadcast lo trae inscruptado
  final _emailController    = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  
  //Recuprar los datos del Stream
  Stream<String> get emailStream    => _emailController.stream.transform( validateEmail );
  Stream<String> get passwordStream => _passwordController.stream.transform( validatePassword );

  Stream<bool> get formValidStream => 
        CombineLatestStream.combine2(emailStream, passwordStream, (e, p) => true);
      
  //Insertar valores al Stream
  Function(String) get changeEmail    => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  
  //Obtener el ultimo valor ingresado a los Streams
  String get email    => _emailController.value;
  String get password => _passwordController.value;
  
  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}

class LoginBlocName with Validators {

  final _nameController = BehaviorSubject<String>();

  Stream<String> get nameStream   => _nameController.stream.transform( validateName );

  Function(String) get changeName => _nameController.sink.add;
  String get name => _nameController.value;

  dispose() {
    _nameController?.close();
  }
}
