import 'package:flutter/material.dart';

//api: https://www.jianshu.com/p/b64dccaf8499
class SwitchWidget extends StatefulWidget {

  void _textValueChange(String value) {
    print("_textValueChange: $value");
  }

  void _textValueSubmit(String value) {
    print("_textValueSubmit: $value");
  }

  @override
  State createState() {
    return SwitchState();
  }
}

class SwitchState extends State {
  bool isCheck = false;
  bool isCheck1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("TextField"),
      ),
      body: Column(
        children: <Widget>[
          Switch(
            value: isCheck,
            onChanged: (isChecked) {
              setState(() {
                isCheck = isChecked;
              });
            },

            activeColor: Colors.black,
            activeTrackColor: Colors.blue,
//
            inactiveThumbColor: Colors.green,
            inactiveTrackColor: Colors.orange,

//              activeThumbImage: AssetImage("images/app.png"),
//              inactiveThumbImage: AssetImage("images/app.png"),

            materialTapTargetSize: MaterialTapTargetSize.padded,
          ),
          Container(
            color: Colors.grey,
            child: SwitchListTile(
              value: isCheck1,
              onChanged: (isChecked) {
                setState(() {
                  isCheck1 = isChecked;
                });
              },
              activeColor: Colors.red,
              title: Text("标题"),
              subtitle: Text("副标题副标题副标题副标题副标题副标题副标题副标题副标题"),
              secondary: Icon(Icons.alarm),
              selected: true,
              activeThumbImage: AssetImage("images/app.png"),
              inactiveThumbImage: AssetImage("images/app.png"),
              isThreeLine: false,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            color: Colors.grey,
            child: SwitchListTile(
              value: isCheck1,
              onChanged: (isChecked) {
                setState(() {
                  isCheck1 = isChecked;
                });
              },
              activeColor: Colors.red,
              title: Text("标题"),
              subtitle: Text("副标题副标题副"),
              secondary: Icon(Icons.alarm),
              selected: true,
              //activeThumbImage: AssetImage("images/app.png"),
              //inactiveThumbImage: AssetImage("images/app.png"),
              isThreeLine: true,
            ),
          )
        ],
      ),
    );
  }
}