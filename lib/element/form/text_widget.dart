import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//api: https://www.jianshu.com/p/f9ba72671f8d
class TextWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Text"),
    ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Hello World", textAlign: TextAlign.center, textDirection: TextDirection.rtl,),

          ],
        ),
      ),
    );
  }

}