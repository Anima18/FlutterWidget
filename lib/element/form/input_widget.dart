import 'package:flutter/material.dart';

//api: https://www.jianshu.com/p/b64dccaf8499
class InputWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("TextField"),
    ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("基础输入框"),
            TextField( ),

            Text("Material输入框"),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                icon: Icon(Icons.access_alarm),
                labelText: "姓名",
                helperText: "请输入你的真实姓名",
              ),
              onChanged: _textValueChange,
              onSubmitted: _textValueSubmit,
            ),
          ],
        ),
      ),
    );
  }

  void _textValueChange(String value) {
    print("_textValueChange: $value");
  }

  void _textValueSubmit(String value) {
    print("_textValueSubmit: $value");
  }
}