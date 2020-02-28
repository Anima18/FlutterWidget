
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget/custom/refreshListView/refresh_listView.dart';
import 'package:flutter_widget/custom/request/netweorkRequest.dart';
import 'package:flutter_widget/custom/word_listItemView.dart';
import 'package:flutter_widget/entity/jjb_data_entity.dart';

class RefreshListViewTest extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("RefreshList"),
      ),
      body: RefreshListView<JjbDataDataList>(
        pageSize: 30,
        itemViewCreator: WordListItemView(),
        onItemClick: (int position, dynamic data) {
          print("$position ======= $data");
        },
        onDataRequest: (int page, int pageSize, RefreshListViewState state) async {
          print("======onRefresh======== $page ============$pageSize");
          String url = "http://192.168.60.93:8080/utdcjjb/fdjiaojiebanlog/list.do?rows=$pageSize&page=$page&sidx=lrtime&sord=desc";
          NetworkRequest<JjbDataEntity>(url).get(
              onSuccess: (JjbDataEntity data) {
                if (data.result == "1") {
                  var xList = data.data.xList;
                  state.showData(xList);
                } else {
                  state.showError(data.info);
                }
              },
              onError: (String message) => state.showError(message));

          /*Future.delayed(Duration(seconds: 3)).then((e) {
            //state.showData(null);
            //state.showError("网络请求失败");
            if(state.getDataSize() < 100) {
              List<String> datas = generateWordPairs().take(pageSize).map((e) => e.asPascalCase as String).toList();
              print(datas);
              state.showData(datas);
            }else {
              state.showError("网络请求失败");
            }
          });*/
        },
      )

    );
  }
}