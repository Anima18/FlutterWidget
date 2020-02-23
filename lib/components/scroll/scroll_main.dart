
import 'package:flutter/material.dart';

class ScrollMain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Scroll Widget"),
      ),
      body: Builder(builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: OutlineButton(
                  child: Text("SingleChildScrollView",),
                  onPressed: () {
                    Navigator.pushNamed(context, "singleChildScrollView_widget");
                  },
                ),
              ),
              Container(
                width: double.infinity,
                child: OutlineButton(
                  child: Text("CustomScrollView",),
                  onPressed: () {
                    Navigator.pushNamed(context, "customScrollView_widget");
                  },
                ),
              ),
              Container(
                width: double.infinity,
                child: OutlineButton(
                  child: Text("ScrollView listener",),
                  onPressed: () {
                    Navigator.pushNamed(context, "scrollVIew_listener");
                  },
                ),
              )
            ],
          ),
        );
      })
    );
  }
}