import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locally/src/pages/sign_in_pages/second_page.dart';
import 'package:locally/src/utils/text_styles.dart';
import 'package:locally/src/utils/text_box.dart';
import '../../utils/button_class.dart';
import '../sign_up_pages/sign_up_step1.dart';

import 'package:firebase_auth/firebase_auth.dart';

import "package:google_sign_in/google_sign_in.dart";
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

 final FirebaseAuth _auth = FirebaseAuth.instance;
 final GoogleSignIn googleSignIn = new GoogleSignIn();
 final FacebookLogin facebookLogin = new FacebookLogin();

  Future<FirebaseUser> _signInGoogle() async {
    
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

     final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
     );
     
     final AuthResult authResult = await _auth.signInWithCredential(credential);
     final FirebaseUser user = authResult.user;

     assert(!user.isAnonymous);
     assert(user.email != null);
     assert(user.displayName != null);
     assert(await user.getIdToken() != null);

     print("User Name:  ${user.displayName}");
     
     return user;
  }

  void signOutGoogle() async{
   await googleSignIn.signOut();

   print("User Sign Out");
  }

  Future<FirebaseUser> _signInFacebook() async {
    
     final facebookLogin = FacebookLogin();
     final result = await facebookLogin.logIn(['email']);

     if ( result.status != FacebookLoginStatus.loggedIn){
       return null;
     }

     final AuthCredential credential = FacebookAuthProvider.getCredential(
      accessToken: result.accessToken.token,
     );
     
     final AuthResult authResult = await _auth.signInWithCredential(credential);
     final FirebaseUser user = authResult.user;

     print("User Name:  ${user.displayName}");
     
     return user;
  }


class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(child: Text("Crear una cuenta.", style: normalTextStyle)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  _emailLoginButton(),
                  _facebookLoginButton(),
                  _googleLoginButton(),
                  TextBox(
                    text:"al crear una cuenta aceptas nuestros terminos y condiciones",
                    textStyle: normalTextStyle,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  TextBox(
                    text: "¿Ya tienes una cuenta?",
                    textStyle: normalTextStyle,
                  ),
                  TextBox(
                    text: "Sign in",
                    textStyle: textButton,
                    gesture: MaterialPageRoute(builder: (context) => SignInPage()),                       
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

Widget _emailLoginButton() {

  return Container(
    child: LoginButtonCard(
      imageIcon: Icon(Icons.email, color: Colors.white),
      text: Text("continue with Email",style: emailTextStyle),
      colour: Color(0xff6969ff),
      stream: MaterialPageRoute(builder: (context) => SignUpEmail())),
  );
}

Widget _googleLoginButton(){  

  return Container(
      width: double.infinity,
      height: 67,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: RaisedButton(
        color:Color(0xffd0caca),
      onPressed: ()=> _signInGoogle().then((FirebaseUser user)=>print(user)).catchError((e)=>print(e)),  
      child: Row(
        children: <Widget>[
          Icon(FontAwesomeIcons.google, color: Colors.white, textDirection: TextDirection.ltr,),
          Container(
            margin: EdgeInsets.only(left: 38),
            child: Text("continue with Google",style: facebookTextStyle)),
        ],
      ),
    ),
  );
 }
 Widget _facebookLoginButton(){  

  return Container(
      width: double.infinity,
      height: 67,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: RaisedButton(
        color:Color(0xff1e599b),
      onPressed: ()=> _signInFacebook().then((FirebaseUser user)=>print(user)).catchError((e)=>print(e)),  
      child: Row(
        children: <Widget>[
          Icon(FontAwesomeIcons.facebook, color: Colors.white, textDirection: TextDirection.ltr,),
          Container(
            margin: EdgeInsets.only(left: 38),
            child: Text("continue with Facebook",style: facebookTextStyle)),
        ],
      ),          
    ),
  );
 }
}