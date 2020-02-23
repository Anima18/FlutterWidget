import 'package:flutter/material.dart';

class NavigationWidget extends StatefulWidget {
  @override
  State createState() {
    return NavigationState();
  }
}

class NavigationState extends State {
  List<String> _titleList;

  List<Widget> _pages;
  int _currentIndex = 0;
  List<BottomNavigationBarItem> _items;

  NavigationState() {
    _titleList = <String>["首页", "查询", "信息", "我"];
    _pages = <Widget>[HomePage(), SearchPage(), MessagePage(), MePage()];
    _items = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          title: Text(_titleList[0]),
          icon: Icon(Icons.home)
      ),
      BottomNavigationBarItem(
          title: Text(_titleList[1]),
          icon: Icon(Icons.search)
      ),
      BottomNavigationBarItem(
          title: Text(_titleList[2]),
          icon: Icon(Icons.message)
      ),BottomNavigationBarItem(
          title: Text(_titleList[3]),
          icon: Icon(Icons.person)
      )
    ];
  }

  void onItemClick(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(_titleList[_currentIndex]),
        ),
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.blue,
          iconSize: 24.0,
          currentIndex: _currentIndex,
          onTap: onItemClick,
          items: _items,
        ),
    );
  }
}
class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("首页", style: TextStyle(fontSize: 28),),
    );
  }
}

class MessagePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("信息", style: TextStyle(fontSize: 28),),
    );
  }
}

class SearchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("查询", style: TextStyle(fontSize: 28),),
    );
  }
}

class MePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("我", style: TextStyle(fontSize: 28),),
    );
  }
}