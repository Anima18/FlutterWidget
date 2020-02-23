

import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Table Widget"),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Table(
          columnWidths: const{
            0: FlexColumnWidth(1.0),
            1: FlexColumnWidth(1.0),
            2: FixedColumnWidth(50),
            3: FixedColumnWidth(50),
          },
          border: TableBorder.all(
            color: Colors.red,
            width: 1,
            style: BorderStyle.solid
          ),
          children: const[
            TableRow(
              children: [
                Text("A1"),
                Text("A1"),
                Text("A1"),
                Text("A1"),
              ]
            ),
            TableRow(
                children: [
                  Text("A1"),
                  Text("A1"),
                  Text("A1"),
                  Text("A1"),
                ]
            ),
            TableRow(
                children: [
                  Text("A1"),
                  Text("A1"),
                  Text("A1"),
                  Text("A1"),
                ]
            ),
            TableRow(
                children: [
                  Text("A1"),
                  Text("A1"),
                  Text("A1"),
                  Text("A1"),
                ]
            )
          ],
        ),
      ),
    );
  }
}