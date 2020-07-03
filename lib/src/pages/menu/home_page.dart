import 'package:flutter/material.dart';
import 'package:locally/src/components/category_view_component.dart';
import 'package:locally/src/model/event_model.dart';
import 'package:locally/src/pages/category_page.dart';
import 'package:locally/src/pages/inbox_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

TabController _tabController;
String title = "Bottom Navigation Bar.";

  final _allEvents = <Event>[
    Event('Cerveza Night', 'Bar Chiringito', '40m', "https://ep01.epimg.net/elviajero/imagenes/2018/08/09/album/1533839819_319783_1533841402_noticia_normal_recorte1.jpg", DateTime.now()),
    Event('Recorrido Jardín Japonés', 'Garden', '100m', "https://www.jardineriaon.com/wp-content/uploads/2017/06/jardin-japones-1024x683.jpg", DateTime.now()),
    Event('Laura Pergolizzi en Santiago', 'Cúpula Multiespacio', '700m', "https://www.concierto.cl/wp-content/uploads/2019/08/GettyImages-456172574-768x512.jpg", DateTime.now()),
    Event('Skate Park Sunset', 'Bowlpark Parque Araucano', '550m', "https://tribusurbanas.online/wp-content/uploads/2019/05/tribus-urbanas-skaters-768x511.jpg", DateTime.now()),
  ];

  final _allPlaces = <Places>[
    Places('Zanzibar Restaurante', "http://www.reservandovinos.com/uploads/l_48_zanzibar-restaurante-santiago-de-chile-2.jpg"),
    Places('Bar Latina', "http://www.nuevodiarioweb.com.ar/uploads/imagenes/repositorio/2020/05/30/307231/2020053010441326bb3eff73fe11a12c57cf4dab4183f6.jpg"),
    Places('Plaza de Armas', "https://upload.wikimedia.org/wikipedia/commons/3/3e/Plaza_de_Armas.JPG"),
    Places('Club La Feria',  "https://finde.latercera.com/wp-content/uploads/2018/09/club-la-feria.jpg"),
  ];

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: false,
            title: GestureDetector(
              child: Row(
                children: <Widget>[
                  Container(
                      height: 20,
                      width: 20,
                      child: Image(image:AssetImage("assets/images/combined_shape.png")),
                  ),
                  SizedBox(width: 8),
                  Text("Comunidad", style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
            pinned: true,
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 1),
                child: GestureDetector(
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 30,
                  ),
                  onTap: () {
                    _profileOptionsBottomSheet(context);
                  },
                ),
              ),  
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                  child: IconButton(
                   onPressed: () {
                     MaterialPageRoute(builder: (context) => Inbox());
                   },
                   icon: Icon(Icons.inbox),
                   color: Colors.black,
                   iconSize: 30,
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: <Widget>[
                  Positioned(
                    top:150,
                    bottom: 0,
                    left: 5,
                    right: 5,
                    child: Container(
                      height: 160,
                      child: Image.network(
                          "https://image.shutterstock.com/image-vector/group-young-happy-dancing-people-260nw-1203116578.jpg"),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.height * 0.6,
                        padding: EdgeInsets.only(
                            top: 0,
                            left: 18,
                            right: MediaQuery.of(context).size.width * 0.2),
                        child: Text(
                          "¡Hola! Descubre toda la oferta local, cerca de ti.",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 24,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 1),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 9,
                    ),
                    Container(
                      child: Text("Locally", style: TextStyle( fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                      padding: EdgeInsets.only(top: 12, left: 20, right: 20, bottom: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff6969ff)),
                    ),
                    CategoryButton(
                      title: "Vida Sana",
                    ),
                    CategoryButton(
                      title: "Cultura",
                    ),
                    CategoryButton(
                      title: "Ciudad Verde",
                    ),
                    CategoryButton(
                      title: "Aire Libre",
                    ),
                    CategoryButton(
                      title: "Gastronomía",
                    ),
                    CategoryButton(
                      title: "Música",
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [
               CategoryViewComponent(events: _allEvents, places: _allPlaces),   
              ],
            ),
            ),
          ),
        ],
      )
    );
  }

  GestureDetector categorybutton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
          margin: EdgeInsets.only(left: 18, right: 18),
          child: Text("Vida Sana", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
    );
  }
}

class CategoryButton extends StatelessWidget {
  CategoryButton({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage()));
      },
      child: Container(
          margin: EdgeInsets.only(left: 18, right: 18),
          child: Text(title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
    );
  }
}

void _profileOptionsBottomSheet(context) {
  
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Color(0xff737373),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * .40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Previzualizar tu perfil"),
                          Icon(Icons.remove_red_eye)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Editar perfil"),
                          Icon(Icons.edit)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Crear nuevo evento"),
                          Icon(Icons.add)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Promocionar un evento"),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(Icons.scatter_plot)
                        ],
                      ),
                    ],
                  ),
                ),
                Text("Sign out"),
              ],
            ),
            height: MediaQuery.of(context).size.height * .60,
            padding: EdgeInsets.only(left: 30, top: 18, right: 30, bottom: 75),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(30),
                topRight: const Radius.circular(30),
              ),
            ),
          ),
        );
      });
}
