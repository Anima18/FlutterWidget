
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
        pageSize: 20,
        itemViewCreator: WordListItemView(),
        onItemClick: (int position, dynamic data) {
          print("$position ======= $data");
        },
        onDataRequest: (int page, int pageSize, RefreshListViewState state) async {
          requestData(page, pageSize, state);
        },
      )

    );
  }

  void requestData(int page, int pageSize, RefreshListViewState state) {
    print("======onRefresh======== $page ============$pageSize");
    String url = "http://192.168.60.93:8080/utdcjjb/fdjiaojiebanlog/list.do?rows=$pageSize&page=$page&sidx=lrtime&sord=desc";
    NetworkRequest<JjbDataEntity>(url, requestHeaders: {
      "Cookie":"JSESSIONID=534FD6FAA2A18DDD824751155332C78F",
      "user-agent": "android"
    }).get(
        onSuccess: (JjbDataEntity data) {
          if (data.result == "1") {
            var xList = data.data.xList;
            state.showData(xList);
          } else {
            state.showError(data.info);
          }
        },
        onError: (String message) => state.showError(message));
  }

}