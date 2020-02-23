
import 'package:flutter/material.dart';

class ProgressMain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Progress Widget"),
      ),
      body: Builder(builder: (BuildContext context) {
        return Stack(
          children: <Widget>[
            Positioned(
                left: 150.0,
                top: 20.0,
                child: CircularProgressIndicator(
                )
            ),
            Positioned(
                left: 150.0,
                top: 70.0,
                child: CircularProgressIndicator(
                  value: 0.3,
                  backgroundColor: Color(0xffff0000),
                )
            ),
            Positioned(
                left: 150.0,
                top: 120.0,
                child: CircularProgressIndicator(
//                    value: 0.3,
                  strokeWidth: 4.0,
                  backgroundColor: Color(0xffff0000),
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                )
            ),
            Positioned(
                left: 150.0,
                top: 170.0,
                child: CircularProgressIndicator(
//                    value: 0.3,
                  strokeWidth: 8.0,
                  backgroundColor: Color(0xffff0000),
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                )
            ),
            Positioned(
                left: 150.0,
                top: 220.0,
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
//                    value: 0.3,
                    backgroundColor: Color(0xffff0000),
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                )
            ),
          ],
        );
      })
    );
  }
}