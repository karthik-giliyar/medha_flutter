import 'package:flutter/material.dart';

class NotificationFeed extends StatefulWidget {
  const NotificationFeed({Key? key}) : super(key: key);

  @override
  _NotificationFeedState createState() => _NotificationFeedState();
}

class _NotificationFeedState extends State<NotificationFeed> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 15,
      itemBuilder: (context, index) {
        return Column(children: [
          Container(
            padding: const EdgeInsets.all(7),
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: SizedBox(
                child: Row(children: [
              Container(
                height: 50,
                width: 50,
                child: const Icon(
                  Icons.notification_important,
                  size: 20,
                ),
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(10)),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  padding: const EdgeInsets.only(
                      top: 5, left: 8, right: 8, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: const Text("Daily Revenue Drop"),
                        onTap: () {},
                      ),
                      const SizedBox(height: 5),
                      const Text("Value drops below 1cr",
                          style: TextStyle(fontSize: 10, color: Colors.grey)),
                      const SizedBox(height: 5),
                      const Text("14-Analysis",
                          style: TextStyle(fontSize: 10, color: Colors.grey))
                    ],
                  ),
                ),
              )
            ])),
          ),
          const Divider(height: 1)
        ]);
      },
    );
  }
}
