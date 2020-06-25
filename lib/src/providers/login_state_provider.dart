import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginState with ChangeNotifier{

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
     
     return user;
  }
}