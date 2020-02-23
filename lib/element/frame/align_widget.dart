import 'package:flutter/material.dart';

class AlignWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Align"),
    ),
      body: Builder(builder: (BuildContext context) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CustomAlign(Alignment.topLeft),
                CustomAlign(Alignment.centerLeft),
                CustomAlign(Alignment.bottomLeft),
                CustomAlign(Alignment.topCenter),
                CustomAlign(Alignment.center),
                CustomAlign(Alignment.bottomCenter),
                CustomAlign(Alignment.topRight),
                CustomAlign(Alignment.centerRight),
                CustomAlign(Alignment.bottomRight),
              ],
            ),
          ),
        );
      })

    );
  }
}

class CustomAlign extends StatelessWidget {
  AlignmentGeometry _alignment;

  CustomAlign(this._alignment);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 100,
      margin: EdgeInsets.only(top: 16),
      color: Colors.red,
      child:Align(
        alignment: _alignment,
        child: Text("Hello World", style: TextStyle(color: Colors.white),),
      ),
    );
  }
}