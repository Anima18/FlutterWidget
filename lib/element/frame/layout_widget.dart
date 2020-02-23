

import 'package:flutter/material.dart';

class LayoutWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Layout Widget"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child:  Container(
                    color: Colors.red,
                    height: 100,
                    child: Center(child: Text("hello"),),
                  ),
                ),

                Expanded(
                  child:  Container(
                    color: Colors.red,
                    height: 100,
                    child: Center(child: Text("hello"),),
                  ),
                ),
                Expanded(
                  child:  Container(
                    color: Colors.red,
                    height: 100,
                    child: Center(child: Text("hello"),),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child:  Container(
                    color: Colors.red,
                    height: 100,
                    child: Center(child: Text("hello"),),
                  ),
                ),

                Expanded(
                  child:  Container(
                    color: Colors.red,
                    height: 100,
                    child: Center(child: Text("hello"),),
                  ),
                ),
                Expanded(
                  child:  Container(
                    color: Colors.red,
                    height: 100,
                    child: Center(child: Text("hello"),),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child:  Container(
                    color: Colors.red,
                    height: 100,
                    child: Center(child: Text("hello"),),
                  ),
                ),

                Expanded(
                  child:  Container(
                    color: Colors.red,
                    height: 100,
                    child: Center(child: Text("hello"),),
                  ),
                ),
                Expanded(
                  child:  Container(
                    color: Colors.red,
                    height: 100,
                    child: Center(child: Text("hello"),),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child:  Container(
                    color: Colors.red,
                    height: 100,
                    child: Center(child: Text("hello"),),
                  ),
                ),

                Expanded(
                  child:  Container(
                    color: Colors.red,
                    height: 100,
                    child: Center(child: Text("hello"),),
                  ),
                ),
                Expanded(
                  child:  Container(
                    color: Colors.red,
                    height: 100,
                    child: Center(child: Text("hello"),),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child:  Container(
                    color: Colors.red,
                    height: 100,
                    child: Center(child: Text("hello"),),
                  ),
                ),

                Expanded(
                  child:  Container(
                    color: Colors.red,
                    height: 100,
                    child: Center(child: Text("hello"),),
                  ),
                ),
                Expanded(
                  child:  Container(
                    color: Colors.red,
                    height: 100,
                    child: Center(child: Text("hello"),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}