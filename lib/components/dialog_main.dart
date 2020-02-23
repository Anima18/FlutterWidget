import 'package:flutter/material.dart';
import 'package:flutter_demo/components/loading_dialog.dart';

class DialogMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Dialog Widget"),
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
                    child: Text(
                      "AlertDialog",
                    ),
                    onPressed: () {
                      showAlertDialog(context);
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: OutlineButton(
                    child: Text(
                      "Loading Dialog",
                    ),
                    onPressed: () {
                      showLoadingDialog(context);
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: OutlineButton(
                    child: Text(
                      "AboutDialog",
                    ),
                    onPressed: () {
                      showAlertDialog(context);
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: OutlineButton(
                    child: Text(
                      "SimpleDialog",
                    ),
                    onPressed: () {
                      showSimpleDialog(context);
                    },
                  ),
                ),
              ],
            ),
          );
        }));
  }

  //https://www.jianshu.com/p/1107f8ad23e3
  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("提示"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("hello flutter"),
                  Text("hello flutter"),
                  Text("hello flutter"),
                  Text("hello flutter"),
                  Text("hello flutter")
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("确认"),
                onPressed: () {},
              ),
              FlatButton(
                child: Text("取消"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return LoadingDialog(
            title: "加载中...",
            cancelListener: () {
              print("你取消了请求");
            },
          );
        });
  }

  //https://www.jianshu.com/p/b03f34202dff
  void showAboutDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AboutDialog(
            applicationName: "名字",
            applicationIcon: Image.asset("icons/ic_launcher.png"),
            applicationVersion: "1.0.0",
            children: <Widget>[
              Text("内容内容内容内容内容内容内容"),
            ],
          );
        }
    );
  }

  //https://www.jianshu.com/p/2cc402d66af5
  void showSimpleDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return SimpleDialog(
            title: Text("这是标题"),
            children: <Widget>[
              SimpleDialogOption(
                child: Text("这是第一行"),
                onPressed: () {
                  print("点击了第一行");
                },
              ),
              SimpleDialogOption(
                child: Text("这是第二行"),
                onPressed: () {
                  print("点击了第二行");
                },
              ),
            ],

          );
        }
    );
  }
}
