import 'package:flutter/material.dart';
import 'package:flutter_widget/custom/stateView/StateView.dart';
import 'package:flutter_widget/element/form/button_widget.dart';

// ignore: must_be_immutable
class StateViewTest extends StatefulWidget {


  @override
  State createState() {
    return StateViewState();
  }
}

class StateViewState extends State {
  ViewStatus viewStatus = ViewStatus.loading;
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
            title: Text("StateView"),
            actions: <Widget>[
              FlatButton(
                child: Text("contnet"),
                onPressed: () {
                  setState(() {
                    viewStatus = ViewStatus.content;
                  });
                },
              ),
              FlatButton(
                child: Text("loading"),
                onPressed: () {
                  setState(() {
                    viewStatus = ViewStatus.loading;
                  });
                },
              ),
              FlatButton(
                child: Text("error"),
                onPressed: () {
                  setState(() {
                    viewStatus = ViewStatus.error;
                    errorMessage = "网络请求失败";
                  });
                },
              ),
              FlatButton(
                child: Text("empty"),
                onPressed: () {
                  setState(() {
                    viewStatus = ViewStatus.empty;
                  });
                },
              ),
            ]),
        body: StateView(
          viewStatus: viewStatus,
          errorMessage: errorMessage,
          child: ButtonWidget(),
          onRetry: () {
            print("stateView retry");
            setState(() {
              viewStatus = ViewStatus.loading;
            });
          },
        )
    );
  }
}
