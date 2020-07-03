import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:locally/src/data/managers/colors_managers.dart';
import 'package:locally/src/pages/menu/calendar_page.dart';
import 'package:locally/src/pages/menu/home_page.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedIndex = 0;

  final _pages = [
    HomePage(),
    Container(color: Colors.green,),
    CalendarPage(),
    Container(color: Colors.blue,),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      extendBody: true,
      body: _pages[_selectedIndex],
      bottomNavigationBar: _createBottomNavigationBar(),
    );
  }

  Widget _createBottomNavigationBar(){
    return Container(
      margin: EdgeInsets.only(bottom: 18, left: 52, right: 52),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0x15000000),
            offset: Offset(0, 4),
            blurRadius: 26,
            spreadRadius: 1,
        )]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            color: Colors.white,
            child: BottomNavigationBar(
              elevation: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: Colors.white,
              selectedItemColor: AppColors.purpleMain,
              unselectedItemColor: AppColors.unselectedColor,
              type: BottomNavigationBarType.fixed,
              iconSize: 32,
              onTap: _onItemTapped,
              currentIndex: _selectedIndex,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem (
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                ),
                BottomNavigationBarItem (
                  icon: Icon(Icons.near_me),
                  title: Text('Mapa'),
                ),
                BottomNavigationBarItem (
                  icon: Icon(Icons.calendar_today),
                  title: Text('Calendar'),
                ),
                BottomNavigationBarItem (
                  icon: Icon(Icons.person),
                  title: Text('Perfil'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}