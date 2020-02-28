import 'package:flutter/material.dart';

import 'refreshListView/listItem_creator.dart';
import 'package:flutter_widget/entity/jjb_data_entity.dart';

class WordListItemView extends ListItemCreator<JjbDataDataList> {



  @override
  Widget bind(int position, JjbDataDataList data) {
    return  Container(
      height: 56,
      child: Center(
        child: Text("${data.zhiciFname} - ${data.banciFname}"),
      ),
    );
  }

}
