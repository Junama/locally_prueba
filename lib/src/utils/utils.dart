
import 'package:flutter/material.dart';
import 'package:locally/src/utils/text_styles.dart';


void showAlert( BuildContext context, String message ) {

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)),
          elevation: 10,
          backgroundColor: Colors.white,
          title: Text(message, style:alertDialog),
          actions: <Widget>[
            FlatButton(
              onPressed: ()=> Navigator.of(context).pop(), 
              child: Text("Ok", style: alertDialog),
            )
          ],
        );
    }
  );
}