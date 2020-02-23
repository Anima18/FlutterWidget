import 'package:flutter/material.dart';

//api: https://www.jianshu.com/p/1cbc2c18dbcb
class CheckBoxWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("CheckBox"),
    ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("选择框"),
            CheckStatefullBox("自动登陆", true),
            Text("CheckboxListTile"),
            CheckboxListTile(
              value: true,
              isThreeLine: false,
              secondary: Icon(Icons.access_time),
              title: Text("上次同步时间"),
              subtitle: Text("2020-02-02 02:02:02"),
            )
          ],
        ),
      ),
    );
  }

}

class CheckStatefullBox extends StatefulWidget {

  String _label;
  bool value;
  CheckStatefullBox(this._label, this.value);

  @override
  State createState() {
    return _CheckBoxState(_label, value);
  }
}

class _CheckBoxState extends State {
  String _label;
  bool value;

  _CheckBoxState(this._label, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Checkbox(
        value: value,
        tristate: false,
        onChanged: (bool bol) {
          setState(() {
            value = bol;
          });
        }),
        Padding(
          padding: EdgeInsets.only(left: 4),
          child: Text(_label),
        )
      ],
    );
  }
}