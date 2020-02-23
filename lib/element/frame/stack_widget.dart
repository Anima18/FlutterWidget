import 'package:flutter/material.dart';

class StackWidget extends StatefulWidget {

  @override
  State createState() {
    return IndexedStackState();
  }
}

class IndexedStackState extends State {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("stack"),

        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IndexedStack(
              index: _index,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
                Container(
                  width: 90,
                  height: 90,
                  color: Colors.blue,
                ),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.green,
                ),
              ],
            ),
            RaisedButton(
              child: Text("切换图层"),
              onPressed: () {
                setState(() {
                  if(_index < 2) {
                    ++_index;
                  }else {
                    _index = 0;
                  }
                });
              },
            ),
          ],
        )
    );
  }
}