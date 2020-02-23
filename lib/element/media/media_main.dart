
import 'package:flutter/material.dart';

class MediaMain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Media Widget"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: OutlineButton(
                child: Text("Image",),
                onPressed: () {
                  Navigator.pushNamed(context, "image_widget");
                },
              ),
            ),
            Container(
              width: double.infinity,
              child: OutlineButton(
                child: Text("Icon",),
                onPressed: () {
                  Navigator.pushNamed(context, "stack_widget");
                },
              ),
            ),
            Container(
              width: double.infinity,
              child: OutlineButton(
                child: Text("Canvas",),
                onPressed: () {
                  Navigator.pushNamed(context, "layout_widget");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}