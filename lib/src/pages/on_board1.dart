import 'package:flutter/material.dart';
import 'package:locally/src/strings/text_styles.dart';

class FirstOnBoardPage extends StatelessWidget {
  const FirstOnBoardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
              child: Stack(
          children: <Widget>[
              _circleBackgroung(),
              _image(),
              _text(),
              _buttonContinue(),
          ],
        ),
      ),
    );
  }
}

Widget _circleBackgroung(){

  return Stack(
    children: <Widget>[
      PositionedDirectional(
                 top: -20,
                 end: 1,
                 child: 
               Container(
                 width: 221,
                 height: 184,
                 decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                   color: const Color(0xff6969ff),
                   width: 1
                 )
                )
               ),
              ),
    ],
  );
}

Widget _image(){
  return Stack(
    children: <Widget>[
      PositionedDirectional(
              top: 125,
              start: 65,
              child: Container(
                width: 245,
                height: 242,
                decoration: BoxDecoration(
                  //color: const Color(0xffffffff),
                  image: DecorationImage(
                      image: ExactAssetImage("assets/drawable/calendar_colour.png"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
    ],
  );
}

Widget _text(){

  return Stack(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: 400, right: 20, left: 20),
        child: Text("Descubre y revisa toda la oferta local.  Agenda eventos y compartelos con tus cercanos.",
        style: onBoardText,
        textAlign: TextAlign.center                
     ),
      )
    ],
  );
}

Widget _buttonContinue(){

  return Container(
    width: 149,
    height: 49,
    margin: EdgeInsets.only(top: 490),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
      Radius.circular(32) 
      ),
     color: const Color(0xff6969ff)
    )
  );
}

