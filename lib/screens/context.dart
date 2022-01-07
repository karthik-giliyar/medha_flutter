import 'package:flutter/material.dart';

class ContextPage extends StatefulWidget {
  const ContextPage({Key? key}) : super(key: key);

  @override
  _ContextPageState createState() => _ContextPageState();
}

class _ContextPageState extends State<ContextPage> {
  String _radioVal = "Popular";

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          height: 110,
          child: Align(
            alignment: const Alignment(0, 1.0),
            child: SizedBox(
              height: 30,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 30,
                        child: Row(
                          mainAxisSize:MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                          Text("AVAILABLE CONTEXT (7)", style: TextStyle(fontSize: 12),),
                          Icon(Icons.arrow_downward_outlined)
                        ]),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () => showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10))),
                        builder: (context) => bottomSortModal(),
                      ),
                      child: SizedBox(
                        height: 30,
                        child: Row(
                          mainAxisSize:MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                          Text("sort by: popular"),
                          Icon(Icons.arrow_downward_outlined)
                        ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
      Expanded(
        child: ListView.builder(
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
                child: Row(
                  children: [
                  const Icon(Icons.stacked_line_chart),
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
                            child: const Text("North Area"),
                            onTap: () {},
                          ),
                          const SizedBox(height: 5),
                          const Text("OP Consultaion",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              )),
                          const SizedBox(height: 5),
                          const Text("IP Consultaion",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ))
                        ],
                      ),
                    ),
                  )
                ])),
              ),
              const Divider(height: 1)
            ]);
          },
        ),
      )
    ]);
  }

  Widget bottomSortModal() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Text("Sort & Filter", style: TextStyle(fontSize: 25)),
              Expanded(
                child: Container(),
              ),
              const Text("Reset Filters", style: TextStyle(fontSize: 15)),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                child: const Icon(Icons.close),
                onTap: () {
                  Navigator.pop(context);
                }
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: <Widget>[
              RadioListTile(
                title: const Text('Popular'),
                value: "Popular",
                groupValue: _radioVal,
                onChanged: (String? value) {
                  setState(() {
                    if(value!=null){
                      _radioVal = value;
                    }
                  });
                },
              ),
              RadioListTile(
                title: const Text('Frequently Used'),
                value: "Frequently Used",
                groupValue: _radioVal,
                onChanged: (String? value) {
                  setState(() {
                    if(value!=null){
                      _radioVal = value;
                    }
                  });
                },
              ),
              RadioListTile(
                title: const Text('Increasing'),
                value: "Increasing",
                groupValue: _radioVal,
                onChanged: (String? value) {
                  setState(() {
                    if(value!=null){
                      _radioVal = value;
                    }
                  });
                },
              ),
              RadioListTile(
                title: const Text('decreasing'),
                value: "decreasing",
                groupValue: _radioVal,
                onChanged: (String? value) {
                  setState(() {
                    if(value!=null){
                      _radioVal = value;
                    }
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Apply")),
          )
        ],
      ),
    );
  }
}





          // SizedBox(
          //   height: 140,
          //   child: Align(
          //     alignment: const Alignment(0, 1.0),
          //     child: SizedBox(
          //         height: 30,
          //         child: Row(
          //           children: [
          //             Expanded(
          //               child: Center(
          //                 child:Container(
          //                   width: 200,
          //                   height: 40,
          //                   padding: const EdgeInsets.only(right: 20),
          //                   decoration: BoxDecoration(
          //                       color: Theme.of(context).primaryColor,
          //                       borderRadius: BorderRadius.circular(10)),
          //                   child: DropdownButton<String>(
          //                     menuMaxHeight:200,
          //                     onChanged: (value) {
          //                       setState(() {
          //                         _selectedColor = value;
          //                       });
          //                     },
          //                     value: _selectedColor,

          //                     // Hide the default underline
          //                     underline: Container(),
          //                     hint: const Center(
          //                         child: Text(
          //                       'Available Context',
          //                       style: TextStyle(color: Colors.white),
          //                     )),
          //                     icon: const Icon(
          //                       Icons.arrow_downward_rounded,
          //                     ),
          //                     isExpanded: true,

          //                     // The list of options
          //                     items: _animals
          //                         .map((e) => DropdownMenuItem(
          //                               child: Container(
          //                                 alignment: Alignment.centerLeft,
          //                                 child: Text(
          //                                   e,
          //                                   style: const TextStyle(fontSize: 16),
          //                                 ),
          //                               ),
          //                               value: e,
          //                             )
          //                           )
          //                         .toList(),

          //                     // Customize the selected item
          //                     selectedItemBuilder: (BuildContext context) => _animals
          //                         .map((e) => Center(
          //                               child: Text(
          //                                 e,
          //                                 style: const TextStyle(
          //                                     fontSize: 16,
          //                                     fontStyle: FontStyle.normal,
          //                                     fontWeight: FontWeight.bold),
          //                               ),
          //                             ))
          //                         .toList(),
          //                   ),
          //               ),
          //             )),
          //             Expanded(
          //               child: Center(
          //                 child: Container(
          //                   width: 200,
          //                   height: 40,
          //                   padding: const EdgeInsets.only(right: 20),
          //                   decoration: BoxDecoration(
          //                       color: Theme.of(context).primaryColor,
          //                       borderRadius: BorderRadius.circular(10)),
          //                   child: DropdownButton<String>(
          //                     menuMaxHeight:200,
          //                     onChanged: (value) {
          //                       setState(() {
          //                         _selectedColor = value;
          //                       });
          //                     },
          //                     value: _selectedColor,

          //                     // Hide the default underline
          //                     underline: Container(),
          //                     hint: const Center(
          //                         child: Text(
          //                       'popular',
          //                       style: TextStyle(color: Colors.white),
          //                     )),
          //                     icon: const Icon(
          //                       Icons.arrow_downward_rounded,
          //                     ),
          //                     isExpanded: true,

          //                     // The list of options
          //                     items: _animals
          //                         .map((e) => DropdownMenuItem(
          //                               child: Container(
          //                                 alignment: Alignment.centerLeft,
          //                                 child: Text(
          //                                   e,
          //                                   style: const TextStyle(fontSize: 16),
          //                                 ),
          //                               ),
          //                               value: e,
          //                             )
          //                           )
          //                         .toList(),

          //                     // Customize the selected item
          //                     selectedItemBuilder: (BuildContext context) => _animals
          //                         .map((e) => Center(
          //                               child: Text(
          //                                 e,
          //                                 style: const TextStyle(
          //                                     fontSize: 16,
          //                                     fontStyle: FontStyle.normal,
          //                                     fontWeight: FontWeight.bold),
          //                               ),
          //                             ))
          //                         .toList(),
          //                   ),
          //               ),)),
          //           ],
          //         )),
          //   ),