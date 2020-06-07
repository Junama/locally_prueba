import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:locally/src/blocs/provider.dart';

class SignUpEmail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final bloc= Provider.of(context);
   
    return Scaffold(
      body: SingleChildScrollView(
              child: Stack(
          children: <Widget>[          
            _logText(),
            _email( bloc ),
            _stepText(),
            _loading(),
          ],
         ),
      )
      );
    }
}

Widget _logText(){
  return Stack(
    children: <Widget>[
       Container(
             width: 162,
             height: 21,
             margin: EdgeInsets.only(left:36, right: 177, top: 100.0, bottom: 1.0),
             child: Text( "ingresa tu correo.", style: const TextStyle( color:  const Color(0xff565656), fontWeight: FontWeight.w600,
                         fontFamily: "SFProText", fontStyle:  FontStyle.normal, fontSize: 18.0)
             )
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
                      hintStyle: TextStyle( color: Color(0xff989898),fontWeight: FontWeight.w600,fontFamily: "SFProText", 
                                          fontStyle: FontStyle.normal,fontSize: 18.0 ),
                      errorText: snapshot.error,
                     ),
                     style: TextStyle(color: Color(0xff989898),fontWeight: FontWeight.w600,fontFamily: "SFProText", 
                                      fontStyle: FontStyle.normal,fontSize: 18.0),
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
             child: Text( "Paso 1/3", style: const TextStyle( color: const Color(0xff464646), fontWeight: FontWeight.w400,
                         fontFamily: "SFProText", fontStyle: FontStyle.normal, fontSize: 18.0)
             )
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
    child: Container(
      width: 95,
      height: 7,
     margin: EdgeInsets.only(left:44, right:236, top: 413.0, bottom: 1.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
         Radius.circular(6) 
        ),
     color: const Color(0xff6969ff)
)
)
   ),
  );
}