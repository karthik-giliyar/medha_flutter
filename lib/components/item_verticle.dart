import 'package:flutter/material.dart';
import '../models/feed.dart';

class ItemVerticle extends StatefulWidget {
  const ItemVerticle({Key? key, required this.feed}) : super(key: key);

  final List<Feed> feed;

  @override
  _ItemVerticleState createState() => _ItemVerticleState();
}

class _ItemVerticleState extends State<ItemVerticle> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: widget.feed.length,
      itemBuilder: (context, index) {
        Feed feed = widget.feed[index];
        return Column(
          children: [
            Container(
              padding:const EdgeInsets.all(7),
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                          SizedBox(
                              child: Text("Monthly: 76 Cr",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12))),
                          SizedBox(
                              child: Text("Querterly: 276 Cr",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12))),
                          SizedBox(
                              child: Text("Yearly: 976 Cr",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12)))
                        ])),
                    SizedBox(
                        child: Row(children: [
                      Container(
                        height: 50,
                        width: 50,
                        child: const Icon(Icons.auto_graph_outlined),
                        decoration: BoxDecoration(
                            color: Colors.grey[700],
                            borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          padding: const EdgeInsets.only(
                              top: 5, left: 8, right: 8, bottom: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: InkWell(
                                  child:Text(feed.title),
                                  onTap: (){},
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Update frequency: Monthly',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 10),
                                  ),
                                  Text('Last Updated: 10/12/2021',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10)),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ]))
                  ])),
                  const Divider(height: 1)
          ],
        );
      },
    );
  }
}
