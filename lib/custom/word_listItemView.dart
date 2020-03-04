import 'package:flutter/material.dart';

import 'package:flutter_widget/entity/jjb_data_entity.dart';
import 'refreshListView/refresh_listView.dart';

class WordListItemView extends ListItemCreator<JjbDataDataList> {



  @override
  Widget bind(int position, JjbDataDataList data) {
    return  Container(
      height: 56,
      child: Center(
        child: Text("$position . ${data.zhiciFname} - ${data.banciFname}"),
      ),
    );
  }

}
