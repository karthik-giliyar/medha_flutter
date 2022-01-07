import 'package:flutter/material.dart';
import '../components/search_bar.dart';
import 'create_handles_group.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _subScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(12, 3, 12, 0),
              child: SearchBar(subScreenIndex: _subScreenIndex)),
          Positioned(
            top: 9,
            right: 12,
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[800],
              ),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
                    builder: (context) => bottomFilterModal(),
                  );
                },
                child: const Icon(Icons.filter_alt_outlined),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateHandlesGroup()),
                    );
                  },
                  icon: const Icon(Icons.add),
                  color: Colors.black,
                )),
          )
        ]),
      ),
      bottomNavigationBar: BottomNavyBar(
        iconSize: 25,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        showElevation: true,
        itemCornerRadius: 10,
        animationDuration: const Duration(milliseconds: 500),
        curve: Curves.linear,
        selectedIndex: _subScreenIndex,
        onItemSelected: (index) => setState(() => _subScreenIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
            textAlign: TextAlign.center,
            activeColor: Colors.blue,
            inactiveColor: Colors.white,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.notifications_none_rounded),
            title: const Text('Notify'),
            textAlign: TextAlign.center,
            activeColor: Colors.blue,
            inactiveColor: Colors.white,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.credit_card_rounded),
            title: const Text('Context'),
            textAlign: TextAlign.center,
            activeColor: Colors.blue,
            inactiveColor: Colors.white,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.dehaze_rounded),
            title: const Text('Menu'),
            textAlign: TextAlign.center,
            activeColor: Colors.blue,
            inactiveColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget bottomFilterModal(){
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Text("Sort & Filter", style: TextStyle(fontSize: 25),),
                Expanded(child: Container()),
                const Text("Reset filters", style: TextStyle(fontSize: 13, color:Colors.blue)),
                const SizedBox(width: 10,),
                const Icon(Icons.close)
              ]
            ),
          ),
          const Divider(),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: const [
                      Text("hello"),
                      Text("hello"),
                      Text("hello"),
                    ],
                  )
                ),
                const VerticalDivider(),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: const [
                      Text("hello"),
                      Text("hello"),
                      Text("hello"),
                    ],
                  )
                )
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment : MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Apply")
                )
              ],
            ),
          )
        ],
      ),
    
    );

  }
}
