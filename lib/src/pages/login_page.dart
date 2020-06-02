import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Stack(
          children: <Widget>[          
             _loginMail(),
             _loginFacebook(),
             _loginGoogle(),
             _loginText(),
          ],
         ),
      )
      );
    }
  }
          
Widget _loginMail() {

  return Stack(
   children: <Widget>[
      Container(
        width: 267.0,
        height: 50.0,
        margin: EdgeInsets.only(left:42.0, right: 66.0, top: 114.0, bottom: 1.0),
        child: Center(
          child:Text("Crear una cuenta.", style: TextStyle(fontSize: 18.0)),
       ),
      ),
  
     Container(
         width : 336,
         height: 66,
         margin: EdgeInsets.only(left:19.0, right: 18.0, top: 165.0, bottom: 21.0),
         decoration: BoxDecoration(
             borderRadius: BorderRadius.all(
             Radius.circular(6) 
             ),
             color: const Color(0xff6969ff)
            ),
             child:Stack(
                children:<Widget>[
                Center(
                child: Text("Sign up with E-mail",style: const TextStyle(color:  const Color(0xffffffff),
                   fontWeight: FontWeight.w500,fontFamily: "SFProText",fontStyle:  FontStyle.normal, fontSize: 21.0) 
                ),
               ),
                PositionedDirectional(
                top: 25,
                start: 22,
                child: Container(
                   width: 24,
                   height: 18,
                   decoration: BoxDecoration(
                    //color: const Color(0xffffffff),
                    image: DecorationImage(
                      image: ExactAssetImage("assets/drawable/mail.png"),
                      fit: BoxFit.cover
                      ),
                  ),
                 ),
               ) 
              ]
            ),
     ),
   ], 
  );
}

Widget _loginFacebook() {

  return Stack(
   children: <Widget>[
     Container(
         width : 336,
         height: 67,
         margin: EdgeInsets.only(left:19.0, right: 18.0, top: 252.0, bottom: 21.0),
         decoration: BoxDecoration(
             borderRadius: BorderRadius.all(
             Radius.circular(6) 
             ),
             color: const Color(0xff1e599b)
            ),
             child:Stack(
                children:<Widget>[
                Center(
                child:Text("Sign up with Facebook", style: const TextStyle(color: const Color(0xffffffff),fontWeight: FontWeight.w600,
                      fontFamily: "SFProText", fontStyle:  FontStyle.normal, fontSize: 18.0)
                      )
               ),
                PositionedDirectional(
                top: 19,
                start: 25,
                bottom: 19,
                child: Container(
                   width: 14,
                   height: 29,
                   decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage("assets/drawable/facebook.png"),
                      fit: BoxFit.cover
                      ),
                  ),
                 ),
               ) 
              ]
            ),
     ),
   ], 
  );
}

Widget _loginGoogle(){
 return Stack(
   children: <Widget>[
     Container(
         width : 336,
         height: 67,
         margin: EdgeInsets.only(left:19.0, right: 18.0, top: 340.0, bottom: 21.0),
         decoration: BoxDecoration(
             borderRadius: BorderRadius.all(
             Radius.circular(6) 
             ),
             color: const Color(0xffd0caca)
            ),
             child:Stack(
                children:<Widget>[
                Center(
                child:Text("Sign in with Google",style: const TextStyle(color: const Color(0xffffffff), fontWeight: FontWeight.w600,
                           fontFamily: "SFProText", fontStyle:  FontStyle.normal, fontSize: 18.0)
                      )
                ),
                PositionedDirectional(
                top: 21,
                start: 25,
                bottom: 21,
                child: Container(
                   width: 24,
                   height: 25,
                   decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage("assets/drawable/google_icon.png"),
                      fit: BoxFit.cover
                      ),
                  ),
                 ),
               ) 
              ]
            ),
     ),
   ], 
  );
} 

Widget _loginText(){
  return Stack(
    children: <Widget>[
       Container(
             width: 350,
             margin: EdgeInsets.only(left:39, right: 39, top: 445.0, bottom: 1.0),
             child: Text.rich(
               TextSpan(
                 text: "al crear una cuenta aceptas nuestros ",
                 style: const TextStyle(color:  const Color(0xff566556),
                        fontWeight: FontWeight.w500, fontFamily: "SFProText", fontStyle:  FontStyle.normal, fontSize: 18.0),
               children:<TextSpan>[
                 TextSpan(
                  text:"terminos y condiciones.",
                  style: const TextStyle(color:  const Color(0xff566556),
                         fontWeight: FontWeight.w500, fontFamily: "SFProText", fontStyle:  FontStyle.normal, fontSize: 18.0,
                         decoration: TextDecoration.underline),
                 )
                ] 
               ),
                textAlign: TextAlign.center
            )
           ),
       Container(
             width: 267,
             height: 50,
             margin: EdgeInsets.only(left:54.0, right: 54.0, top: 570.0, bottom: 1.0),
             child: 
             Text("Already have an account?", style: const TextStyle(color:  const Color(0xff566556),fontWeight: FontWeight.w500,
                  fontFamily: "SFProText",fontStyle: FontStyle.normal,fontSize: 18.0),
                  textAlign: TextAlign.center)
       ),
       Container(
             width: 71,
             height: 50,
             margin: EdgeInsets.only(left:145.0, right: 145.0, top: 617.0, bottom: 1.0),
             child: Text("sign in.", style: const TextStyle(color:  const Color(0xff6969ff),fontWeight: FontWeight.w600,
                         fontFamily: "SFProText", fontStyle:  FontStyle.normal, fontSize: 21.0,  decoration: TextDecoration.underline),
                         textAlign: TextAlign.center)
       ),    
    ],
  );
}