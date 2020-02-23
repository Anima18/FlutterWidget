
import 'package:flutter/material.dart';

class FrameMain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Frame Widget"),
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
                child: Text("Align",),
                onPressed: () {
                  Navigator.pushNamed(context, "align_widget");
                },
              ),
            ),
            Container(
              width: double.infinity,
              child: OutlineButton(
                child: Text("Stack",),
                onPressed: () {
                  Navigator.pushNamed(context, "stack_widget");
                },
              ),
            ),
            Container(
              width: double.infinity,
              child: OutlineButton(
                child: Text("Layout",),
                onPressed: () {
                  Navigator.pushNamed(context, "layout_widget");
                },
              ),
            ),
            Container(
              width: double.infinity,
              child: OutlineButton(
                child: Text("Box",),
                onPressed: () {

                },
              ),
            ),
            Container(
              width: double.infinity,
              child: OutlineButton(
                child: Text("Expanded",),
                onPressed: () {

                },
              ),
            ),
            Container(
              width: double.infinity,
              child: OutlineButton(
                child: Text("Spacing",),
                onPressed: () {},
              ),
            ),
            Container(
              width: double.infinity,
              child: OutlineButton(
                child: Text("Table",),
                onPressed: () {
                  Navigator.pushNamed(context, "table_widget");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}