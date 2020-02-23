
import 'package:flutter/material.dart';

class FormMain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Form Widget"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: OutlineButton(
                child: Text("Input",),
                onPressed: () {
                  Navigator.pushNamed(context, "input_widget");
                },
              ),
            ),
            Container(
              width: double.infinity,
              child: OutlineButton(
                child: Text("Checkbox",),
                onPressed: () {
                  Navigator.pushNamed(context, "checkbox_widget");
                },
              ),
            ),
            Container(
              width: double.infinity,
              child: OutlineButton(
                child: Text("Button",),
                onPressed: () {
                  Navigator.pushNamed(context, "button_widget");
                },
              ),
            ),
            Container(
              width: double.infinity,
              child: OutlineButton(
                child: Text("Text",),
                onPressed: () {
                  Navigator.pushNamed(context, "text_widget");
                },
              ),
            ),
            Container(
              width: double.infinity,
              child: OutlineButton(
                child: Text("Radio",),
                onPressed: () {
                  Navigator.pushNamed(context, "radio_widget");
                },
              ),
            ),
            Container(
              width: double.infinity,
              child: OutlineButton(
                child: Text("Slider",),
                onPressed: () {},
              ),
            ),
            Container(
              width: double.infinity,
              child: OutlineButton(
                child: Text("Switch",),
                onPressed: () {
                  Navigator.pushNamed(context, "switch_widget");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}