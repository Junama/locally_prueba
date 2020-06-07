import 'package:flutter/material.dart';
import 'package:locally/src/blocs/provider.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final bloc= Provider.of(context);

    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              _logFacebook(),
              _logGoogle(),
              _logEmail( bloc ),
              _logPassword( bloc ),
              _logText(),
              _buttonSignIn( bloc ),
            ],
          ),
        )
    );
  }
}

Widget _logFacebook(){

  return Stack(
   children: <Widget>[
     Container(
         width : 336,
         height: 67,
         margin: EdgeInsets.only(left:16.0, right: 23.0, top: 137.0, bottom: 21.0),
         decoration: BoxDecoration(
             borderRadius: BorderRadius.all(
             Radius.circular(6) 
             ),
             color: const Color(0xff1e599b)
            ),
             child:Stack(
                children:<Widget>[
                Center(
                child: FlatButton(
                         child: Text("Log in with Facebook", style: const TextStyle(color: const Color(0xffffffff), fontWeight: FontWeight.w600,
                                    fontFamily: "SFProText", fontStyle:  FontStyle.normal, fontSize: 18.0),
                                ),
                         onPressed: () {},
                           /*Navigator.push(context,
                           MaterialPageRoute(builder: (context) => SignInPage()));
                        },*/
                      ),
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

Widget _logGoogle(){
  return Stack(
   children: <Widget>[
     Container(
         width : 336,
         height: 67,
         margin: EdgeInsets.only(left:17.0, right: 22.0, top: 225.0, bottom: 21.0),
         decoration: BoxDecoration(
             borderRadius: BorderRadius.all(
             Radius.circular(6) 
             ),
             color: const Color(0xffd0caca)
            ),
             child:Stack(
                children:<Widget>[
                Center(
                child:FlatButton(
                      child: Text("Sign in with Google",style: const TextStyle(color: const Color(0xffffffff), fontWeight: FontWeight.w600,
                                  fontFamily: "SFProText", fontStyle:  FontStyle.normal, fontSize: 18.0)
                            ),
                      onPressed: () {},
                           /*Navigator.push(context,
                           MaterialPageRoute(builder: (context) => SignInPage()));
                  },*/   
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

Widget _logEmail( LoginBloc bloc ){
  
  return StreamBuilder(
    stream: bloc.emailStream ,
    builder: (BuildContext context, AsyncSnapshot snapshot){
      return Stack(
        children: <Widget>[
           Container(
             width : 333,
             height: 64,
             margin: EdgeInsets.only(left:19.0, right: 23.0, top: 411.0, bottom: 21.0),
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

Widget _logPassword( LoginBloc bloc ){ 
  
  return StreamBuilder(
    stream: bloc.passwordStream ,
    builder: (BuildContext context, AsyncSnapshot snapshot){
     return Stack(
        children: <Widget>[
          Container(
            width : 333,
            height: 64,
            margin: EdgeInsets.only(left:19.0, right: 23.0, top: 490.0, bottom: 21.0),
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
                  width: 280,
                  height: 54,
                  child: TextField(
                     decoration: InputDecoration( 
                      focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xfff0f0f0))
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle( color: Color(0xff989898),fontWeight: FontWeight.w600,fontFamily: "SFProText", 
                                           fontStyle: FontStyle.normal,fontSize: 18.0, ),
                     errorText: snapshot.error,
                     ),
                     style: TextStyle(color: Color(0xff989898),fontWeight: FontWeight.w600,fontFamily: "SFProText", 
                                      fontStyle: FontStyle.normal,fontSize: 18.0),
                     keyboardType: TextInputType.visiblePassword,
                     onChanged: ( value ) =>bloc.changePassword(value),
                     obscureText: true,
                  )
                ),
               ) 
              ]
            ),
      ),
    ], 
   );
  },
 );
}

Widget _logText(){
  return Stack(
    children: <Widget>[
       Container(
             width: 71,
             height: 25,
             margin: EdgeInsets.only(left:148, right: 156, top: 339.0, bottom: 1.0),
             child: Text("Or", style: const TextStyle(color: const Color(0xff566556), fontWeight: FontWeight.w500,
                         fontFamily: "SFProText", fontStyle: FontStyle.normal, fontSize: 21.0),
                      textAlign: TextAlign.center)
       ),
       Container(
             width: 267,
             height: 29,
             margin: EdgeInsets.only(left:51.0, right: 57.0, top: 590.0, bottom: 50.0),
             child: FlatButton(
                 padding: EdgeInsets.only(left: 1, right: 1, top: 10, bottom: 1),
                 child: Text("olvidaste tu contraseña?",style: const TextStyle(color: const Color(0xff6969ff), fontWeight: FontWeight.w600,
                             fontFamily: "SFProText", fontStyle:  FontStyle.normal, fontSize: 18.0),
                        textAlign: TextAlign.center),
                 onPressed: () {},
                           /*Navigator.push(context,
                           MaterialPageRoute(builder: (context) => SignInPage()));
                 },*/
            )
       ),    
    ],
  );
}

Widget _buttonSignIn(LoginBloc bloc){

return StreamBuilder(
  stream: bloc.formValidStream,
  builder: (BuildContext context, AsyncSnapshot snapshot){
      return Stack(
     children: <Widget>[
       Container(
           width : 336,
           height: 71,
           margin: EdgeInsets.only(left:22.0, right: 17.0, top: 661.0, bottom: 21.0),
           decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(6)),
           ),
           child: RaisedButton(
             child: Text("sign in.", style: const TextStyle(color: const Color(0xffffffff), fontWeight: FontWeight.w500,
                         fontFamily: "SFProText", fontStyle: FontStyle.normal, fontSize: 21.0)
                        ),
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
  print("Password: ${ bloc.password }");
  print("================");

  //Navigator.pushReplacementNamed(context, routeName);

}