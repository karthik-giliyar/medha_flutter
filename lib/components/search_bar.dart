import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import './horizontal_items.dart';
import '../screens/notification.dart';
import '../screens/context.dart';

class SearchBar extends StatefulWidget {
  final int subScreenIndex;
  const SearchBar({Key? key, required this.subScreenIndex}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  static const historyLength = 5;

  final List<String> _searchHistory = [
    'flutter',
    'widgets',
    'react js',
    'java',
  ];

  late List<String> filteredSearchHistory;

  String? selectedTerm;

  List<String> filterSearchTerms({required String filter}) {
    if (filter != "" && filter.isNotEmpty) {
      return _searchHistory.reversed
          .where((term) => term.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      putSearchTermFirst(term);
      return;
    }
    _searchHistory.add(term);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }
    filteredSearchHistory = filterSearchTerms(filter: "");
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory = filterSearchTerms(filter: "");
  }

  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  late FloatingSearchBarController controller;

  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
    filteredSearchHistory = filterSearchTerms(filter: "");
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  static List<Widget> subScreen = <Widget>[
    SearchResultsListView(),
    const NotificationPage(),
    const ContextPage()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FloatingSearchBar(
        controller: controller,
        height: 40,
        width: 280,
        axisAlignment: -1.35,
        body: subScreen[widget.subScreenIndex],
        transitionCurve: Curves.easeInOut,
        transitionDuration: const Duration(milliseconds: 500),
        transition: CircularFloatingSearchBarTransition(),
        physics: const BouncingScrollPhysics(),
        title: Text(
          selectedTerm ?? "Search Here...",
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),
        hint: 'Search Here...',
        leadingActions: [
          FloatingSearchBarAction(
            child: CircularButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // ignore: avoid_print
                print('Places Pressed');
              },
            ),
          ),
        ],
        actions: [
          FloatingSearchBarAction(
            showIfOpened: false,
            child: CircularButton(
              icon: const Icon(Icons.mic),
              onPressed: () {
                // ignore: avoid_print
                print('Places Pressed');
              },
            ),
          ),
          FloatingSearchBarAction.searchToClear(
            showIfClosed: false,
          ),
        ],
        onQueryChanged: (query) {
          setState(() {
            filteredSearchHistory = filterSearchTerms(filter: query);
          });
        },
        onSubmitted: (query) {
          setState(() {
            addSearchTerm(query);
            selectedTerm = query;
          });
          // controller.close();
        },
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.white,
              elevation: 4,
              child: Builder(
                builder: (context) {
                  if (filteredSearchHistory.isEmpty &&
                      controller.query.isEmpty) {
                    return Container(
                      height: 56,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Start searching',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    );
                  } else if (filteredSearchHistory.isEmpty) {
                    return ListTile(
                      title: Text(controller.query),
                      leading: const Icon(Icons.search),
                      onTap: () {
                        setState(() {
                          addSearchTerm(controller.query);
                          selectedTerm = controller.query;
                        });
                        controller.close();
                      },
                    );
                  } else {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: filteredSearchHistory
                          .map(
                            (term) => ListTile(
                              title: Text(
                                term,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              leading: const Icon(Icons.history),
                              trailing: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    deleteSearchTerm(term);
                                  });
                                },
                              ),
                              onTap: () {
                                setState(() {
                                  putSearchTermFirst(term);
                                  selectedTerm = term;
                                });
                                controller.close();
                              },
                            ),
                          )
                          .toList(),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}






























// class SearchBar extends StatefulWidget {
//   const SearchBar({ Key? key }) : super(key: key);

//   @override
//   _SearchBarState createState() => _SearchBarState();
// }

// class _SearchBarState extends State<SearchBar> {
//   @override
//   Widget build(BuildContext context) {
//     bool isShowBuilder = false;

//     return FloatingSearchBar(
//       hint: 'Search Here....',
//       openAxisAlignment: 0.0,
//       axisAlignment: 0.0,
//       scrollPadding: const EdgeInsets.only(top: 16, bottom: 20),
//       elevation: 4.0,
//       physics: const BouncingScrollPhysics(),
//       onQueryChanged: (query) {
//         setState((){
//           isShowBuilder = true;
//         });
//       },
//       transitionCurve: Curves.easeInOut,
//       transitionDuration: const Duration(milliseconds: 500),
//       transition: CircularFloatingSearchBarTransition(),
//       debounceDelay: const Duration(milliseconds: 500),
//       leadingActions: [
//         FloatingSearchBarAction(
//           child: CircularButton(
//             icon: const Icon(Icons.search),
//             onPressed: () {
//               // ignore: avoid_print
//               print('Places Pressed');
//             },
//           ),
//         ),
//       ],
//       actions: [
//         FloatingSearchBarAction(
//           showIfOpened: false,
//           child: CircularButton(
//             icon: const Icon(Icons.mic),
//             onPressed: () {
//               // ignore: avoid_print
//               print('Places Pressed');
//             },
//           ),
//         ),
//         FloatingSearchBarAction.searchToClear(
//           showIfClosed: false,
//         ),
//       ],
//       builder: (context, transition) {
//         return isShowBuilder?ClipRRect(
//           borderRadius: BorderRadius.circular(8.0),
//           child: Material(
//             color: Colors.white,
//             child: Container(
//               height: 200.0,
//               color: Colors.white,
//               child: Column(
//                 children: const [
//                   ListTile(
//                     title: Text('Home'),
//                     subtitle: Text('more info here........'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ):Container();
//       },
//     );
//   }
// }