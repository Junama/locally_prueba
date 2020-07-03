import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:locally/src/utils/text_styles.dart';

class UserAvatar extends StatelessWidget {
  UserAvatar({
    this.stream,
    this.title,
    this.image,
  });

  final MaterialPageRoute stream;
  final String title;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12),
      margin: EdgeInsets.only(left: 6, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(11),
      ),
      width: MediaQuery.of(context).size.width * .3,
      height: MediaQuery.of(context).size.width * .45,
      child: Column(
        children: <Widget>[
          CircleAvatar(radius: 40, backgroundColor: Colors.black),
          SizedBox(
            height: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title, style: placesTitle()),
            ],
          ),
        ],
      ),
    );
  }
}