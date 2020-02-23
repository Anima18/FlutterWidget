
import 'package:flutter/material.dart';
import 'package:flutter_demo/custom/refresh_listView.dart';
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
          /*try {
            Response response = await Dio().get("https://api.github.com/users/yeasy/followers?page=$page&per_page=$pageSize");
            print(response);
          } catch (e) {
            print(e);
          }*/
          Future.delayed(Duration(seconds: 3)).then((e) {
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