import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:locally/src/blocs/provider.dart';
import 'package:locally/src/strings/text_styles.dart';
import 'package:locally/src/pages/sign_up_step2.dart';

class SignUpEmail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final bloc= Provider.of(context);
   
    return Scaffold(
      body: SingleChildScrollView(
              child: Stack(
          children: <Widget>[   
            _back(context),       
            _logText(),
            _email( bloc ),
            _stepText(),
            _loading(),
            _buttonSignIn( bloc, context),
          ],
         ),
      )
      );
    }
}

Widget _back(BuildContext context) {
  return Container(
    width: 24,
    height: 24,
    margin: EdgeInsets.only(top: 55, left: 5, right: 329),
    child: FlatButton(
            child: Icon(Icons.arrow_back, size: 30, color: const Color(0xff6969ff)),
            onPressed: ()=> Navigator.pop(context),
            )
    );
}


Widget _logText(){
  return Stack(
    children: <Widget>[
       Container(
             width: 162,
             height: 21,
             margin: EdgeInsets.only(left:36, right: 177, top: 100.0, bottom: 1.0),
             child: Text( "ingresa tu correo.", style: normalTextGrayStyle), 
       ),
    ]
  );
}    

Widget _email( LoginBloc bloc ){
  
  return StreamBuilder(
    stream: bloc.emailStream ,
    builder: (BuildContext context, AsyncSnapshot snapshot){
      return Stack(
        children: <Widget>[
           Container(
             width : 335,
             height: 64,
             margin: EdgeInsets.only(left:21.0, right: 19.0, top: 131.0, bottom: 21.0),
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(
                 Radius.circular(2) 
                 ),
             color: const Color(0xfff0f0f0)
            ),
             child:Stack(
                children:<Widget>[
                PositionedDirectional(
                top: 10,
                start: 25,
                child: Container(
                  width: 340,
                  height: 55,
                  child: TextField(
                     decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xfff0f0f0))
                      ), 
                      hintText: "E-mail",
                      hintStyle: textButtonGrey,
                      errorText: snapshot.error,
                     ),
                     style: textButtonGrey,
                     keyboardType: TextInputType.emailAddress,
                     onChanged: ( value ) =>bloc.changeEmail(value),
                  ),
                ),
               ), 
              ]
            ),
      ),
    ], 
   );
  },
 );  
}

Widget _stepText(){
  return Stack(
    children: <Widget>[
       Container(
             width: 84,
             height: 45,
             margin: EdgeInsets.only(left:44, right: 240, top: 386.0, bottom: 1.0),
             child: Text( "Paso 1/3", style: normalTextGrayStyle),
       ),
    ]
  );
}

Widget _loading(){

  return Opacity(
  opacity : 0.800000011920929,
  child: Container(
    width: 285,
    height: 7,
    margin: EdgeInsets.only(left:44, right: 46, top: 413.0, bottom: 1.0),
    decoration: BoxDecoration(    
      borderRadius: BorderRadius.all(
      Radius.circular(6) 
      ),
      color: const Color(0xffd4d4d4),
    ),
    child: LinearProgressIndicator(
      backgroundColor: Color(0xffd4d4d4),
      value: 0.35,
      valueColor: AlwaysStoppedAnimation<Color>(Color(0xff6969ff)),
    ),
   ),
  );
}

Widget _buttonSignIn(LoginBloc bloc, BuildContext context){

return StreamBuilder(
  stream: bloc.emailStream,
  builder: (BuildContext context, AsyncSnapshot snapshot){
      return Stack(
     children: <Widget>[
       Container(
           width : 336,
           height: 71,
           margin: EdgeInsets.only(left:19.0, right: 19.0, top: 436.0, bottom: 21.0),
           decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(6)),
           ),
           child: RaisedButton(
             child: Text("siguente", style: buttonSignIn),
             onPressed: snapshot.hasData ? ()=>_login(bloc, context) : null,
             color: const Color(0xff6969ff) ,
           ),
       ),
     ], 
    );   
   },
 );
}

_login(LoginBloc bloc, BuildContext context) {

  print("================");
  print("Email: ${ bloc.email } ");
  
  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPass()));
 
}