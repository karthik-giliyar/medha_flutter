import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class CreateHandlesGroup extends StatefulWidget {
  const CreateHandlesGroup({ Key? key }) : super(key: key);

  @override
  _CreateHandlesGroupState createState() => _CreateHandlesGroupState();
}

class _CreateHandlesGroupState extends State<CreateHandlesGroup> {
  final TextEditingController _groupName = TextEditingController();

  final List<String> _animals = ["Dog", "Cat", "Crocodile", "Dragon"];

  String? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                    const SizedBox(width: 5,),
                    const Text("Create Handle Groups")
                  ]
                ),
                const SizedBox(height: 30,),
                const Text("Group Name"),
                const SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  padding: const EdgeInsets.only(left: 20, bottom: 5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: _groupName,
                    cursorWidth: 1.0,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'E.g. Revenue',
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                const Text("Add to Category"),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton<String>(
                          menuMaxHeight:200,
                          onChanged: (value) {
                            setState(() {
                              _selectedColor = value;
                            });
                          },
                          value: _selectedColor,
                    
                          // Hide the default underline
                          underline: Container(),
                          hint: const Center(
                              child: Text(
                            'Category',
                            style: TextStyle(color: Colors.white),
                          )),
                          icon: const Icon(
                            Icons.arrow_downward_rounded,
                          ),
                          isExpanded: true,
                    
                          // The list of options
                          items: _animals
                              .map((e) => DropdownMenuItem(
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        e,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    value: e,
                                  )
                                )
                              .toList(),
                    
                          // Customize the selected item
                          selectedItemBuilder: (BuildContext context) => _animals
                              .map((e) => Center(
                                    child: Text(
                                      e,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    Expanded(flex: 1,child:Container()),
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: IgnorePointer(
                          ignoring:  true,
                          child: DropdownButton<String>(
                            menuMaxHeight:200,
                            onChanged: (value) {
                              setState(() {
                                _selectedColor = value;
                              });
                            },
                            value: _selectedColor,
                        
                            // Hide the default underline
                            underline: Container(),
                            hint: const Center(
                                child: Text(
                              'Category',
                              style: TextStyle(color: Colors.white),
                            )),
                            icon: const Icon(
                              Icons.arrow_downward_rounded,
                            ),
                            isExpanded: true,
                        
                            // The list of options
                            items: _animals
                                .map((e) => DropdownMenuItem(
                                      enabled : false,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          e,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      value: e,
                                    )
                                  )
                                .toList(),
                        
                            // Customize the selected item
                            selectedItemBuilder: (BuildContext context) => _animals
                                .map((e) => Center(
                                      child: Text(
                                        e,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  ]
                ),
                const SizedBox(height: 30,),
                const Text("Handles"),
                const SizedBox(height: 10,),
                DottedBorder(
                  color: Colors.blue,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: const <double>[5, 2],
                  child: InkWell(
                    onTap: (){},
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,  
                      height: 40,
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.add),
                            Text("Add Handles")
                          ]
                        ),
                      ),
                    ),
                  ),
                )
          
              

              ],
            ),
          ),
    );
  }
}