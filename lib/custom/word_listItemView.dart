import 'package:flutter/material.dart';

import 'listItem_creator.dart';

class WordListItemView<String> extends ListItemCreator<String> {
  @override
  Widget bind(int position, String data) {
    return ListTile(title: Text("$position . $data"),);
  }

}
