import 'package:flutter/material.dart';
import 'package:locally/src/data/managers/colors_managers.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> with SingleTickerProviderStateMixin {

  TabController _inboxTabController;

  @override
  void initState() {
    super.initState();
    _inboxTabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: TabBar(
          controller: _inboxTabController,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: AppColors.purpleMain, width: 3),
          ),
          labelColor: Colors.black,
          unselectedLabelColor: const Color(0xffd8d8d8),
          unselectedLabelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          tabs: <Widget>[
            Tab(
              text: "Calendario",
            ),
            Tab(
              text: "Invitaciones",
            ),
          ],
        ),
      ),
    );
  }
}
