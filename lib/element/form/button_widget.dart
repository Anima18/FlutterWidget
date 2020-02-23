import 'package:flutter/material.dart';

//api: https://www.jianshu.com/p/684efbe858b3
class ButtonWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Button"),
    ),
      body: Builder(builder: (BuildContext context) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("FlatButton", style: TextStyle(fontSize: 18),),
                FlatButton(
                  child: Text("默认按钮"),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text("禁用按钮"),
                  onPressed: null,
                ),
                FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.print),
                    label: Text("图标按钮")
                ),
                Text("RaisedButton", style: TextStyle(fontSize: 18),),
                RaisedButton(
                  child: Text("默认按钮"),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: Text("禁用按钮"),
                  onPressed: null,
                ),
                RaisedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.print),
                    label: Text("图标按钮")
                ),
                Text("IconButton", style: TextStyle(fontSize: 18),),
                IconButton(
                  icon: Icon(Icons.add_a_photo),
                  color: Colors.blue,
                  onPressed: () {},
                  iconSize: 48,
                ),
                Text("PopupMenuButton", style: TextStyle(fontSize: 18),),
                PopupMenuButton(
                  //icon: Icon(Icons.home),
                  child: Icon(Icons.add_a_photo),
                  tooltip: "长按提示",
                  initialValue: "hot",
                  padding: EdgeInsets.all(0.0),
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuItem<String>>[
                      PopupMenuItem<String>(child: ListTile(leading: Icon(Icons.photo), title: Text("选择照片"),), value: "hot",),
                      PopupMenuItem<String>(child: ListTile(leading: Icon(Icons.add_a_photo), title: Text("拍照")), value: "new",),
                    ];
                  },
                  onSelected: (String action) {
                    switch (action) {
                      case "hot":
                        Scaffold.of(context).showSnackBar(SnackBar(content:Text("选择照片")));
                        break;
                      case "new":
                        Scaffold.of(context).showSnackBar(SnackBar(content:Text("拍照")));
                        break;
                    }
                  },
                  onCanceled: () {
                    print("onCanceled");
                  },
                ),
                Text("FloatingActionButton", style: TextStyle(fontSize: 18),),
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  child: Icon(Icons.add),
                  onPressed: () {},
                ),
                Text("RawMaterialButton", style: TextStyle(fontSize: 18),),
                RawMaterialButton(
                  child: Text("默认按钮"),
                  onPressed: () {},
                ),
                Text("DropdownButton", style: TextStyle(fontSize: 18),),
                DropdownStatefulButton(),
                Text("OutlineButton", style: TextStyle(fontSize: 18),),
                OutlineButton(
                  child: Text("默认按钮"),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        );
      })

    );
  }
}

class DropdownStatefulButton extends StatefulWidget {

  @override
  State createState() {
    return DropdownState();
  }
}

class DropdownState extends State {

  var _selectedItem;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text("下拉菜单选择一个人名"),
      items: generateItemList(),
      value: _selectedItem,
      onChanged: (T) {
        setState(() {
          _selectedItem = T;
        });
      },
    );
  }

  List<DropdownMenuItem> generateItemList() {
    return <String>['One', 'Two', 'Free', 'Four']
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();

  }
}