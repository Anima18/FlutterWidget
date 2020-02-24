import 'package:flutter/material.dart';
import 'package:flutter_demo/custom/refreshListView/listItem_creator.dart';

enum _ViewStatus {
  refresh,
  refreshFail,
  noData,
  loadMore,
  loadMoreFail,
  noMoreData,
  showData
}

typedef OnDataRequest = void Function(
    int nextPage, int pageSize, RefreshListViewState state);
typedef OnItemClick<T> = void Function(int position, T data);

class RefreshListView<T> extends StatefulWidget {
  final ListItemCreator<T> itemViewCreator;
  final OnItemClick<T> onItemClick;
  final OnDataRequest onDataRequest;
  final int pageSize;

  const RefreshListView(
      {this.itemViewCreator,
      this.onItemClick,
      this.onDataRequest,
      this.pageSize});

  @override
  RefreshListViewState createState() => new RefreshListViewState(
      itemViewCreator, pageSize, onDataRequest, onItemClick);
}

class RefreshListViewState<T> extends State<RefreshListView> {
  var _dataList = List<T>();
  _ViewStatus _viewStatus = _ViewStatus.refresh;

  ListItemCreator<T> _itemViewCreator;
  OnDataRequest _onDataRequest;
  OnItemClick<T> _onItemClick;
  int _pageSize;
  int _currentPage = 1;
  String _errorMessage;

  RefreshListViewState(this._itemViewCreator, this._pageSize,
      this._onDataRequest, this._onItemClick);

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    if (_viewStatus == _ViewStatus.refresh) {
      return Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );
    } else if (_viewStatus == _ViewStatus.refreshFail) {
      return Container(
        alignment: Alignment.center,
        child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("icons/list_request_error.png", width: 88, height: 88,),
                SizedBox(height: 16,),
                Text(_errorMessage, style: TextStyle(fontSize: 16, color: Colors.black54),),
                FlatButton(
                  child: Text("点击重试"),
                  textColor: Colors.blue,
                  onPressed: () {
                    _refreshData();
                  },
                ),
              ],
            )),
      );
    } else if (_viewStatus == _ViewStatus.noData) {
      return Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("icons/list_request_no_data.png", width: 88, height: 88,),
              SizedBox(height: 16,),
              Text("没有数据", style: TextStyle(fontSize: 16, color: Colors.black54),),
              FlatButton(
                child: Text("点击重试"),
                textColor: Colors.blue,
                onPressed: () {
                  _refreshData();
                },
              ),
            ],
          ));
    } else {
      return RefreshIndicator(
        child: listViewBuilder(context),
        onRefresh: _refreshData,
      );
    }
  }

  Widget listViewBuilder(BuildContext context) {
    return ListView.separated(
      itemCount: _dataList.length + 1,
      itemBuilder: (context, index) {
        if (index == _dataList.length) {
          if (_viewStatus == _ViewStatus.noMoreData) {
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(24.0),
                child: Text("没有更多了"));
          } else if (_viewStatus == _ViewStatus.loadMoreFail) {
            return Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Text(_errorMessage),
                    OutlineButton(
                      child: Text("点击重试"),
                      textColor: Colors.blue,
                      onPressed: () {
                        setState(() {
                          _viewStatus = _ViewStatus.loadMore;
                        });
                        _loadMoreData();
                      },
                    ),
                  ],
                ));
          } else {
            _loadMoreData();
            //加载时显示loading
            return Container(
              padding: const EdgeInsets.all(24.0),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)),
            );
          }
        } else {
          return InkWell(
              onTap: () {
                if (_onItemClick != null) {
                  _onItemClick(index, _dataList[index]);
                }
              },
              child: _itemViewCreator.bind(index, _dataList[index]));
        }
      },
      separatorBuilder: (context, index) => Divider(height: .0),
    );
  }

  Future<Null> _refreshData() async {
    setState(() {
      //重新构建列表
      _viewStatus = _ViewStatus.refresh;
    });
    _currentPage = 1;
    _dataList.clear();
    _onDataRequest(_currentPage, _pageSize, this);
  }

  void _loadMoreData() {
    _onDataRequest(_currentPage, _pageSize, this);
  }

  void showData(List<T> data) {
    if (_isRefresh()) {
      _refreshDataSuccess(data);
    } else {
      _loadDataSuccess(data);
    }
  }

  void _refreshDataSuccess(List<T> data) {
    setState(() {
      if (data == null || data.isEmpty) {
        _viewStatus = _ViewStatus.noData;
      } else {
        _dataList.addAll(data);
        _viewStatus = _ViewStatus.showData;
        _currentPage++;
      }
    });
  }

  void _loadDataSuccess(List<T> data) {
    setState(() {
      if (data == null || data.isEmpty) {
        _viewStatus = _ViewStatus.noMoreData;
      } else {
        _dataList.addAll(data);
        _viewStatus = _ViewStatus.showData;
        _currentPage++;
      }
    });
  }

  void showError(String errorMessage) {
    setState(() {
      _errorMessage = errorMessage;
      if (_isRefresh()) {
        _dataList.clear();
        _viewStatus = _ViewStatus.refreshFail;
      } else {
        _viewStatus = _ViewStatus.loadMoreFail;
      }
    });
  }

  bool _isRefresh() {
    return _currentPage == 1;
  }

  int getDataSize() {
    return _dataList.length;
  }
}
