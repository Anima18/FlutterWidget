import 'package:flutter/material.dart';

import 'refreshListView/listItem_creator.dart';

class WordListItemView<String> extends ListItemCreator<String> {
  @override
  Widget bind(int position, String data) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset("icons/ic_launcher.png", width: 72, height: 72,),
        SizedBox(width: 16,),
        Center(
          child: Text("$position . $data"),
        )
      ],
    );
  }

}
