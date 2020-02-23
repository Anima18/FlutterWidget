import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//api: https://www.jianshu.com/p/f9ba72671f8d

class RadioWidget extends StatefulWidget {

  @override
  State createState() {
    return RadioState();
  }
}

class RadioState extends State {
  String groupValue = "aaa";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Radio"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Radio(
              value: "aaa",
              groupValue: groupValue,
              onChanged: (result) {
                setState(() {
                  groupValue = result;
                });
              },
              activeColor: Colors.red,
              materialTapTargetSize: MaterialTapTargetSize.padded,
            ),
            Radio(
              value: "bbb",
              groupValue: groupValue,
              onChanged: (result) {
                setState(() {
                  groupValue = result;
                });
              },
              activeColor: Colors.red,
              materialTapTargetSize: MaterialTapTargetSize.padded,
            ),

            RadioListTile(
              value: "ccc",
              groupValue: groupValue,
              onChanged: (result) {
                setState(() {
                  groupValue = result;
                });
              },
              activeColor: Colors.red,
              title: Text("标题"),
              subtitle: Text("副标题副标题副标题副标题副标题副标题副标题副标题副标题"),
              isThreeLine: false,
              secondary: Icon(Icons.alarm),
//                selected:true
              controlAffinity: ListTileControlAffinity.trailing,
            )
          ],
        ),
      ),
    );
  }
}