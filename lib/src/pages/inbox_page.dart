import 'package:flutter/material.dart';
import 'package:locally/src/pages/menu_notification/invitation_page.dart';
import 'package:locally/src/pages/menu_notification/calendar.dart';
import 'package:locally/src/pages/menu_notification/messaging_page.dart';

class Inbox extends StatefulWidget {
  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> with SingleTickerProviderStateMixin {
  TabController _inboxMenu;

  @override
  void initState() {
    super.initState();
    _inboxMenu = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          labelPadding: EdgeInsets.only(top: 40, left: 20, right: 20),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          labelColor: Colors.black,
          unselectedLabelColor: const Color(0xffd8d8d8),
          unselectedLabelStyle:
              TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          controller: _inboxMenu,
          labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          tabs: <Widget>[
            Container(
              child: Tab(
                text: "Calendar",
              ),
            ),
            Container(
              child: Tab(
                text: "Inbox",
              ),
            ),
            Container(
              child: Tab(
                text: "Invitación",
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          CalendarScreen(),
          Messaging(),
          Invitations(),
        ],
        controller: _inboxMenu,
      ),
    );
  }
}