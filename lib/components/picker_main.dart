
import 'package:flutter/material.dart';

class PickerMain extends StatefulWidget {

  @override
  State createState() {
    return _PickerState();
  }
}

class _PickerState extends State {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Picker Widget"),
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
                    child: Text(selcetedValue),
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                ),
              ],
            ),
          );
        })
    );
  }

  DateTime _date =  DateTime.now();
  TimeOfDay _time =  TimeOfDay.now();
  String selcetedValue = "DateTimePicker";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      _date = picked;
      _selectTime(context);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
    await showTimePicker(context: context, initialTime: _time);
    if (picked != null) {
      _time = picked;
      setState(() {
        selcetedValue = "${_date.year}-${_date.month}-${_date.day} ${_time.hour}:${_time.minute}:00";
      });
    }
  }

}

