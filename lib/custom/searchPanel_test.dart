import 'package:flutter/material.dart';
import 'package:flutter_widget/custom/searchPanel/popup_window.dart';

class ExpansionPanelPage extends StatefulWidget {
  ExpansionPanelPage({Key key}) : super(key: key);

  @override
  _ExpansionPanelPageState createState() => _ExpansionPanelPageState();
}

class _ExpansionPanelPageState extends State<ExpansionPanelPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanelPage'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: _buildPanel(),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return Container(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          PopupWindowButton(
            offset: Offset(0, 200),
            child: Container(height: 48, alignment: Alignment.center, child: Text("aaaaa", style: TextStyle(fontSize: 20),),),
            window: Container(
              padding: EdgeInsets.all(50),
              alignment: Alignment.center,
              color: Colors.greenAccent,
              height: 200,
              child: Container(
                color: Colors.white,
                height: 50,
              ),
            ),
          ),

          PopupWindowButton(
            offset: Offset(0, 200),
            child: Container(height: 48, alignment: Alignment.center, child: Text("aaaaa", style: TextStyle(fontSize: 20),),),
            window: Container(
              padding: EdgeInsets.all(50),
              alignment: Alignment.center,
              color: Colors.yellowAccent,
              height: 200,
              child: Container(
                color: Colors.white,
                height: 50,
              ),
            ),
          ),

          PopupWindowButton(
            offset: Offset(0, 200),
            child: Container(height: 48, alignment: Alignment.center, child: Text("aaaaa", style: TextStyle(fontSize: 20),),),
            window: Container(
              padding: EdgeInsets.all(50),
              alignment: Alignment.center,
              color: Colors.redAccent,
              height: 200,
              child: Container(
                color: Colors.white,
                height: 50,
              ),
            ),
          ),

          PopupWindowButton(
            offset: Offset(0, 200),
            child: Container(height: 48, alignment: Alignment.center, child: Text("aaaaa", style: TextStyle(fontSize: 20),),),
            window: Container(
              padding: EdgeInsets.all(50),
              alignment: Alignment.center,
              color: Colors.blueAccent,
              height: 200,
              child: Container(
                color: Colors.white,
                height: 50,
              ),
            ),
          )
        ],
      ),
    );
  }
}
