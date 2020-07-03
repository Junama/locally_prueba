import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:locally/src/model/event_model.dart';

class PlacesComponent extends StatefulWidget {

  final Places places;

  PlacesComponent(this.places);

  @override
  _PlacesComponentState createState() => _PlacesComponentState();
}

class _PlacesComponentState extends State<PlacesComponent> {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 16, left: 8, right: 8, top: 8),
      height: size.width * .45 ,
      width: size.width * .8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            offset: Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.network(widget.places.image, fit: BoxFit.cover)
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black],
                    stops: [0.3, 1.0]
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              bottom: 8,
              left: 8,
              right: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  AutoSizeText(
                    widget.places.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
                    minFontSize: 18,
                    stepGranularity: 0.1,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
