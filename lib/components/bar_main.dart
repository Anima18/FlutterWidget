
import 'package:flutter/material.dart';

class BarMain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Bar Widget"),
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
                  child: Text("AppBar",),
                  onPressed: () {
                    Navigator.pushNamed(context, "appBar_widget");
                  },
                ),
              ),
              Container(
                width: double.infinity,
                child: OutlineButton(
                  child: Text("SnackBar",),
                  onPressed: () {
                    var snackbar = SnackBar(
                      content: Text("这是一个SnackBar"),
                      action: SnackBarAction(
                        textColor: Colors.redAccent,
                        label: "撤销",
                        onPressed: () {},
                      ),
                      duration: Duration(seconds: 2),
                    );
                    Scaffold.of(context).showSnackBar(snackbar);
                  },
                ),
              ),
              Container(
                width: double.infinity,
                child: OutlineButton(
                  child: Text("SliverAppBar",),
                  onPressed: () {
                    //Navigator.pushNamed(context, "layout_widget");
                  },
                ),
              ),
              Container(
                width: double.infinity,
                child: OutlineButton(
                  child: Text("FlexibleSpaceBar",),
                  onPressed: () {

                  },
                ),
              ),
              Container(
                width: double.infinity,
                child: OutlineButton(
                  child: Text("TabBar",),
                  onPressed: () {
                    Navigator.pushNamed(context, "tab_widget");
                  },
                ),
              ),
            ],
          ),
        );
      })
    );
  }
}