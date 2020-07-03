import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class EventCard extends StatelessWidget {
  EventCard({
    this.cardChild,
    this.stream,
    this.title,
    this.image,
    this.distance,
    this.lugar,
    this.dateTime,
  });

  final Widget cardChild;
  final MaterialPageRoute stream;
  final String title;
  final String lugar;
  final String distance;
  final Image image;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[400],
                        offset: Offset(0, 4),
                        blurRadius: 8,
                        spreadRadius: 1)
                  ]),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Container(
                    height: MediaQuery.of(context).size.width * .4,
                    width: MediaQuery.of(context).size.width * .8,
                    child: Image.network(
                      'https://finde.latercera.com/wp-content/uploads/2018/06/OK-Parque-Bicentenario_15.jpg',
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.deepPurpleAccent,
                      child: Icon(Icons.scatter_plot, color: Colors.blueAccent),
                      radius: 15,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontFamily: "SFProText",
                              fontStyle: FontStyle.normal,
                              fontSize: 18.0),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "En: ",
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "SFProText",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                            ),
                            Text(
                              lugar.toString(),
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "SFProText",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                            ),
                            Text(" ∙ "),
                            Text(
                              distance,
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "SFProText",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                            ),
                            Text(" ∙ "),
                            Text(
                              dateTime.toString(),
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "SFProText",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}