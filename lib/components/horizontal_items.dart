import 'package:flutter/material.dart';
import '../api/heading_service.dart';
import '../models/complete_data.dart';
import '../components/headers_horizontal.dart';
import '../components/item_verticle.dart';

class SearchResultsListView extends StatelessWidget {
  SearchResultsListView({Key? key}) : super(key: key);

  final services = Services();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: services.completeData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Column(
            children: [
              HeadersHorizontal(headings: snapshot.data?.headings ?? []),
              Container(
                padding: const EdgeInsets.only(left: 6),
                  height: 30,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(children: [
                        Text('ALL HANDLES (${snapshot.data?.feed.length})',
                            style: TextStyle(
                                fontSize: 10, color: Colors.blue[100])),
                        const SizedBox(width: 5),        
                        Transform.scale(
                          scale: 0.75,
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.arrow_downward_rounded),
                          ),
                        )
                      ]))),
              Expanded(child: ItemVerticle(feed: snapshot.data?.feed ?? [])),
            ],
          );
        } else {
          // 10
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
