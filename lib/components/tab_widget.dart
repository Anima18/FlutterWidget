import 'package:flutter/material.dart';

class TabWidget extends StatefulWidget {
  @override
  State createState() {
    return TabState();
  }
}

class TabState extends State with SingleTickerProviderStateMixin {
  //ScrollController _scrollController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
   // _scrollController = ScrollController();
    _tabController = TabController(vsync: this, length: 6);
  }

  @override
  void dispose() {
    super.dispose();
   // _scrollController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Tab Widget"),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: <Widget>[
            Tab(text: "tab1",),
            Tab(text: "tab2",),
            Tab(text: "tab3",),
            Tab(text: "tab4",),
            Tab(text: "tab5",),
            Tab(text: "tab6",),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Text("tab1"),
          Text("tab2"),
          Text("tab3"),
          Text("tab4"),
          Text("tab5"),
          Text("tab6"),
        ],
      ),
    );
  }
}
