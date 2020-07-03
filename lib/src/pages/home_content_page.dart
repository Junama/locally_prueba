import 'package:flutter/material.dart';
import 'package:locally/src/utils/text_styles.dart';
import 'package:locally/src/utils/cards/event_card.dart';
import 'package:locally/src/utils/cards/places_card.dart';
import 'package:locally/src/utils/cards/avatar_card.dart';

class HomePageContent extends StatefulWidget {
  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            SizedBox(height: 35),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, bottom: 15),
                  child: Text(
                    "Eventos",
                    style: listSubtitleStyle(),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      EventCard(
                        title: "Tejiejdi",
                        distance: "45m",
                        lugar: "Centro GAM",
                        dateTime: "Hoy",
                      ),
                      EventCard(
                        title: "iejiejdi",
                        distance: "45m",
                        lugar: "centro GAM",
                        dateTime: "Hoy",
                      ),
                      EventCard(
                        title: "iejiejdi",
                        distance: "45m",
                        lugar: "centro GAM",
                        dateTime: "Hoy",
                      ),
                      EventCard(
                        title: "Tejiejdi",
                        distance: "45m",
                        lugar: "Centro GAM",
                        dateTime: "Hoy",
                      ),
                      EventCard(
                        title: "Tejiejdi",
                        distance: "45m",
                        lugar: "Centro GAM",
                        dateTime: "Hoy",
                      ),
                      EventCard(
                        title: "Tejiejdi",
                        distance: "45m",
                        lugar: "Centro GAM",
                        dateTime: "Hoy",
                      ),
                      EventCard(
                        title: "iejiejdi",
                        distance: "45m",
                        lugar: "centro GAM",
                        dateTime: "Hoy",
                      ),
                      SizedBox(
                        width: 18.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 45.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, bottom: 15),
                  child: Text(
                    "Lugares",
                    style: listSubtitleStyle(),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 8,
                      ),
                      PlaceCard(
                        title: "Centro Gam",
                        distance: "150m",
                      ),
                      PlaceCard(
                        title: "Mercado",
                        distance: "320m",
                      ),
                      PlaceCard(
                        title: "Obra de Teatro",
                        distance: "470m",
                      ),
                      SizedBox(
                        width: 18,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 45.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, bottom: 15),
                  child: Text(
                    "Personas y proyectos",
                    style: listSubtitleStyle(),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      UserAvatar(
                        title: "Ben Dwire",
                      ),
                      UserAvatar(title: "La punta"),
                      UserAvatar(title: "De Calle Restaurant"),
                      UserAvatar(title: "Verdulería JJ"),
                      UserAvatar(title: "Panadería"),
                      SizedBox(
                        width: 18,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 45.0,
            ),
          ],
        ),
      ),
    );
  }
}