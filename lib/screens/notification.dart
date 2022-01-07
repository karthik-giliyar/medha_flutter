import 'package:flutter/material.dart';
import '../components/notification_notification_feed.dart';
import '../components/notification_schedules.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> with TickerProviderStateMixin {
  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 100,
        child: Align(
          alignment: const Alignment(0, 1.0),
          child: SizedBox(
              height: 30,
              child: TabBar(
                controller: _tabController,
                tabs:const <Widget>[
                  Tab(child: Text("Notification Feed")),
                  Tab(child: Text("Schedules")),
                ]
              )
          ),
        ),
      ),
      Expanded(
        child: TabBarView(
          controller: _tabController,
          children: const <Widget>[
            NotificationFeed(),
            Schedules(),
          ]
        ),
      ),
    ]);
  }
}
