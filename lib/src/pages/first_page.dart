import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locally/src/utils/buttons_log.dart';
import 'package:locally/src/pages/second_page.dart';
import 'package:locally/src/utils/text_styles.dart';
import 'package:locally/src/utils/text_box.dart';
import '../utils/button_class.dart';
import '../utils/buttons_log.dart';
import 'sign_up_step1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:google_sign_in/google_sign_in.dart";

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

 final FirebaseAuth _auth = FirebaseAuth.instance;
 final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn() async {
    
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

     final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
     );
     
     final AuthResult authResult = await _auth.signInWithCredential(credential);
     final FirebaseUser user = authResult.user;

     /*assert(!user.isAnonymous);
     assert(user.email != null);
     assert(user.displayName != null);
     assert(await user.getIdToken() != null);

     print("User Name:  ${user.displayName}");*/
     
     return user;
  }

  void signOutGoogle() async{
   await googleSignIn.signOut();

   print("User Sign Out");
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
                  facebookLoginButton,
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
      decoration: BoxDecoration(
          color: Color(0xffd0caca),
      ),
       //Icon(FontAwesomeIcons.google, color: Colors.white),
      child: RaisedButton(
      onPressed: ()=> _signIn().then((FirebaseUser user)=>print(user)).catchError((e)=>print(e)),  
      child: Row(
        children: <Widget>[
          Text("continue with Google",style: facebookTextStyle),
          Icon(FontAwesomeIcons.google, color: Colors.white),
        ],
      ),          
    ),
  );
 }
}