import 'package:flutter/material.dart';
import 'package:locally/src/utils/utils.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with SingleTickerProviderStateMixin {
  TabController _homeMenuBar;

  @override
  void initState() {
    super.initState();
    _homeMenuBar = TabController(length: categoriesMenu.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: SizedBox(
          height: 15,
        ),
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
        centerTitle: false,
        title: Text("Home", style: TextStyle(color: Colors.black)),
        elevation: 0,
        bottom: TabBar(
          labelPadding: EdgeInsets.only(left: 20, right: 20),
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.black),
          isScrollable: true,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          unselectedLabelStyle:
              TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          controller: _homeMenuBar,
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          tabs: <Widget>[
            Container(
              child: Tab(
                text: "Ciudad Verde",
              ),
            ),
            Container(
              child: Tab(
                text: "Vida Sana",
              ),
            ),
            Container(
              child: Tab(
                text: "Cultura",
              ),
            ),
            Container(
              child: Tab(
                text: "Música",
              ),
            ),
            Container(
              child: Tab(
                text: "Exposiciones",
              ),
            ),
            Container(
              child: Tab(
                text: "Aire Libre",
              ),
            ),
            Container(
              child: Tab(
                text: "Gastronomía",
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          CiudadVerde(),
          VidaSana(),
          Cultura(),
          Musica(),
          Exposiciones(),
          AireLibre(),
          Gastronomia(),
        ], //aquí van las páginas de categorías.
        controller: _homeMenuBar,
      ),
    );
  }
}

class CiudadVerde extends StatefulWidget {
  @override
  _CiudadVerdeState createState() => _CiudadVerdeState();
}

class _CiudadVerdeState extends State<CiudadVerde> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Ciudad Verde"));
  }
}

class VidaSana extends StatefulWidget {
  @override
  _VidaSanaState createState() => _VidaSanaState();
}

class _VidaSanaState extends State<VidaSana> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Ciudad Verde"));
  }
}

class Cultura extends StatefulWidget {
  @override
  _CulturaState createState() => _CulturaState();
}

class _CulturaState extends State<Cultura> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Cultura"));
  }
}

class AireLibre extends StatefulWidget {
  @override
  _AireLibreState createState() => _AireLibreState();
}

class _AireLibreState extends State<AireLibre> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Aire Libre"));
  }
}

class Exposiciones extends StatefulWidget {
  @override
  _ExposicionesState createState() => _ExposicionesState();
}

class _ExposicionesState extends State<Exposiciones> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Exposiciones"));
  }
}

class Gastronomia extends StatefulWidget {
  @override
  _GastronomiaState createState() => _GastronomiaState();
}

class _GastronomiaState extends State<Gastronomia> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Gastronimía"));
  }
}

class Musica extends StatefulWidget {
  @override
  _MusicaState createState() => _MusicaState();
}

class _MusicaState extends State<Musica> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Música"));
  }
}