import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:locally/src/utils/text_styles.dart';

class PlaceCard extends StatelessWidget {
  PlaceCard({
    this.stream,
    this.title,
    this.image,
    this.distance,
  });

  final MaterialPageRoute stream;
  final String title;
  final String distance;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(11),
      ),
      width: MediaQuery.of(context).size.width * .4,
      height: MediaQuery.of(context).size.width * .5,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(8), topLeft: Radius.circular(8)),
            child: Image.network(
              'https://finde.latercera.com/wp-content/uploads/2018/06/OK-Parque-Bicentenario_15.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.place,
                color: Colors.white,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: placesTitle(),
                    maxLines: 2,
                  ),
                  Text(
                    distance,
                    style: detailsTextStyle(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}