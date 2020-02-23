import 'package:flutter/material.dart';

class MenuMain extends StatefulWidget {
  @override
  State createState() {
    return _MenuState();
  }
}

class _MenuState extends State {
  List<String> _checkedValues;

  final String _checkedValue1 = 'One';
  final String _checkedValue2 = 'Two';
  final String _checkedValue3 = 'Three';
  final String _checkedValue4 = 'Four';

  @override
  void initState() {
    super.initState();
    _checkedValues = <String>[_checkedValue3];
  }


  bool isChecked(String value) => _checkedValues.contains(value);

  void showCheckedMenuSelections(String value) {
    if (_checkedValues.contains(value)) {
      _checkedValues.remove(value);
    } else {
      _checkedValues.add(value);
    }

    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Checked $_checkedValues')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Menu Widget"),
      ),
      body: Container(
        color: Theme
            .of(context)
            .primaryColor,
        child: ListTile(
          title: const Text('CheckedPopupMenuItem Demo',
            style: TextStyle(color: Colors.white),),
          trailing: PopupMenuButton<String>(
            padding: EdgeInsets.zero,
            onSelected: showCheckedMenuSelections,
            icon: Icon(Icons.menu, color: Colors.white,),
            itemBuilder: (BuildContext context) =>
            <PopupMenuItem<String>>[
              CheckedPopupMenuItem<String>(
                  value: _checkedValue1,
                  checked: isChecked(_checkedValue1),
                  child: Text(_checkedValue1)
              ),
              CheckedPopupMenuItem<String>(
                  value: _checkedValue2,
                  enabled: false,
                  checked: isChecked(_checkedValue2),
                  child: Text(_checkedValue2)
              ),
              CheckedPopupMenuItem<String>(
                  value: _checkedValue3,
                  checked: isChecked(_checkedValue3),
                  child: Text(_checkedValue3)
              ),
              CheckedPopupMenuItem<String>(
                  value: _checkedValue4,
                  checked: isChecked(_checkedValue4),
                  child: Text(_checkedValue4)
              )
            ],
          ),
        ),
      ),
    );
  }
}



class DropdownMenuItemDemo extends StatefulWidget {
  _DropdownMenuItemDemoState createState() => _DropdownMenuItemDemoState();
}

class _DropdownMenuItemDemoState extends State<DropdownMenuItemDemo> {

  String dropdown1Value = 'Three';
  String dropdown2Value;
  String dropdown3Value = 'Four';


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: const Text('Simple dropdown:'),
            trailing: DropdownButton<String>(
              value: dropdown1Value,
              onChanged: (String newValue) {
                setState(() {
                  dropdown1Value = newValue;
                });
              },
              items: <String>['One', 'Two', 'Three', 'Four'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          ListTile(
            title: const Text('Dropdown with a hint:'),
            trailing: DropdownButton<String>(
              value: dropdown2Value,
              hint: const Text('Choose'),
              onChanged: (String newValue) {
                setState(() {
                  dropdown2Value = newValue;
                });
              },
              items: <String>['One', 'Two', 'Three', 'Four'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          ListTile(
            title: const Text('Scrollable dropdown:'),
            trailing: DropdownButton<String>(
              value: dropdown3Value,
              onChanged: (String newValue) {
                setState(() {
                  dropdown3Value = newValue;
                });
              },
              items: <String>[
                'One', 'Two', 'Three', 'Four', 'Can', 'I', 'Have', 'A', 'Little',
                'Bit', 'More', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten'
              ]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}