
import 'package:flutter/material.dart';
import 'package:flutter_demo/custom/refreshListView/refresh_listView.dart';
import 'package:flutter_demo/custom/word_listItemView.dart';
import 'package:english_words/english_words.dart';
import 'package:dio/dio.dart';

class RefreshListViewTest extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("RefreshList"),
      ),
      body: RefreshListView<String>(
        pageSize: 30,
        itemViewCreator: WordListItemView(),
        onItemClick: (int position, dynamic data) {
          print("$position ======= $data");
        },
        onDataRequest: (int page, int pageSize, RefreshListViewState state) async {
          print("======onRefresh======== $page ============$pageSize");

          Future.delayed(Duration(seconds: 3)).then((e) {
            //state.showData(null);
            //state.showError("网络请求失败");
            if(state.getDataSize() < 100) {
              List<String> datas = generateWordPairs().take(pageSize).map((e) => e.asPascalCase as String).toList();
              print(datas);
              state.showData(datas);
            }else {
              state.showError("网络请求失败");
            }
          });
        },
      )

    );
  }
}