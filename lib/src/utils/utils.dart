
import 'package:flutter/material.dart';
import 'package:locally/src/model/category_model.dart';
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

final categories = <Category>[
    Category(1, "Destacados"),
    Category(2, "Ciudad Verde"),
    Category(3, "Vida Sana"),
    Category(4, "Cultura"),
    Category(5, "Música"),
    Category(6, "Exposiciones"),
    Category(7, "Aire Libre"),
    Category(8, "Gastronomía"),
  ];


final categoriesMenu = <Category>[
    Category(1, "Ciudad Verde"),
    Category(2, "Vida Sana"),
    Category(3, "Cultura"),
    Category(4, "Música"),
    Category(5, "Exposiciones"),
    Category(6, "Aire Libre"),
    Category(7, "Gastronomía"),
  ];
  
    