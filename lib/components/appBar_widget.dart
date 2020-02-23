
import 'package:flutter/material.dart';

//https://www.jianshu.com/p/2a84f7fc3be7
class AppBarWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("AppBar Widget"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.alarm),
            tooltip: "Alarm",
            onPressed: () {
              print("Alarm");
            },
          ),
          IconButton(
            icon: Icon(Icons.home),
            tooltip: "Home",
            onPressed: () {
              print("Home");
            },
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) =>
            <PopupMenuItem<String>>[
              PopupMenuItem<String>(child: Text("热度"), value: "hot",),
              PopupMenuItem<String>(child: Text("最新"), value: "new",),
            ],
            onSelected: (String action) {
              switch (action) {
                case "hot":
                  print("hot");
                  break;
                case "new":
                  print("new");
                  break;
              }
            },
            onCanceled: () {
              print("onCanceled");
            },
          )
        ],
      ),

    );
  }
}