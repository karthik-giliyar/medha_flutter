import 'package:flutter/material.dart';
import '../models/header_models.dart';

class HeadersHorizontal extends StatefulWidget {
  const HeadersHorizontal({
    Key? key,
    required this.headings,
  }) : super(key: key);

  final List<Header> headings;

  @override
  _HeadersHorizontalState createState() => _HeadersHorizontalState();
}

class _HeadersHorizontalState extends State<HeadersHorizontal>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<Widget> tabHeading = <Widget>[];
  late List<Header> _header;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 12);
    _header = widget.headings;
  }

  @override
  Widget build(BuildContext context) {
    final tabHeadings = _header.map((heading) => Tab(child: Text(heading.heading)));
    tabHeading = [...tabHeadings];

    return SizedBox(
      height: 100,
      child: Align(    
        alignment: const Alignment(0, 1.0),
        child: SizedBox(
          height: 40,
          child:TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorColor: Colors.blue,
            indicatorWeight: 2,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: tabHeading,
          )
        ),
      ),
    );
  }
}
