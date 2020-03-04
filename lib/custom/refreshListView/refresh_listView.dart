import 'package:flutter/material.dart';

enum _ViewStatus {
  refresh,
  refreshFail,
  noData,
  loadMore,
  loadMoreFail,
  showData
}

typedef OnDataRequest = void Function(
    int nextPage, int pageSize, RefreshListViewState state);

typedef OnItemClick<T> = void Function(int position, T data);

abstract class ListItemCreator<T> {
  Widget bind(int position, T data);
}

class RefreshController {
  RefreshListViewState _state;

  void bindState(RefreshListViewState state) {
    this._state = state;
  }

  void callRefresh() {
    if (_state != null) {
      _state.refreshData();
    }
  }
}

class RefreshListView<T> extends StatefulWidget {
  final ListItemCreator<T> itemViewCreator;
  final OnItemClick<T> onItemClick;
  final OnDataRequest onDataRequest;
  final int pageSize;
  final RefreshController controller;

  const RefreshListView(
      {@required this.itemViewCreator,
      @required this.onItemClick,
      @required this.onDataRequest,
      this.pageSize = 30,
      @required this.controller});

  @override
  RefreshListViewState createState() => new RefreshListViewState();
}

class RefreshListViewState<T> extends State<RefreshListView> {
  var _dataList = List<T>();
  _ViewStatus _viewStatus = _ViewStatus.refresh;
  ScrollController _controller = ScrollController();

  int _currentPage = 1;
  bool _hasNextPage = true;
  bool _isScroll = false;

  @override
  void initState() {
    super.initState();
    refreshData();
    _controller.addListener(() {
      if (_controller.offset > 10) {
        _isScroll = true;
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 绑定控制器
    if (widget.controller != null) {
      widget.controller.bindState(this);
    }
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
          child: GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "icons/list_request_error.png",
                  width: 72,
                  height: 72,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "请求数据失败, 点击重试!",
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ],
            ),
            onTap: () {
              refreshData();
            },
          ),
        ),
      );
    } else if (_viewStatus == _ViewStatus.noData) {
      return Container(
        alignment: Alignment.center,
        child: GestureDetector(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "icons/list_request_no_data.png",
                width: 72,
                height: 72,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "没有数据, 点击重试!",
                style: TextStyle(color: Colors.blueGrey),
              ),
            ],
          ),
          onTap: () {
            refreshData();
          },
        ),
      );
    } else {
      return RefreshIndicator(
        child: listViewBuilder(context),
        onRefresh: refreshData,
      );
    }
  }

  Widget listViewBuilder(BuildContext context) {
    return ListView.separated(
      controller: _controller,
      itemCount: _dataList.length + 1,
      itemBuilder: (context, index) {
        if (index == _dataList.length) {
          if (_viewStatus == _ViewStatus.loadMoreFail) {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(24.0),
              child: GestureDetector(
                child: Text(
                  "请求数据失败, 点击重试!",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                onTap: () {
                  setState(() {
                    _viewStatus = _ViewStatus.showData;
                  });
                  _loadMoreData();
                },
              ),
            );
          } else if (!_hasNextPage) {
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(24.0),
                child: Text(
                  "没有更多了",
                  style: TextStyle(color: Colors.blueGrey),
                ));
          } else {
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
          if (index + widget.pageSize >= _dataList.length + 1 &&
              _viewStatus != _ViewStatus.loadMore &&
              _hasNextPage &&
              _isScroll) {
            _viewStatus = _ViewStatus.loadMore;
            _loadMoreData();
          }
          return InkWell(
              onTap: () {
                if (widget.onItemClick != null) {
                  widget.onItemClick(index, _dataList[index]);
                }
              },
              child: widget.itemViewCreator.bind(index, _dataList[index]));
        }
      },
      separatorBuilder: (context, index) => Divider(height: .0),
    );
  }

  Future<Null> refreshData() async {
    setState(() {
      //重新构建列表
      _viewStatus = _ViewStatus.refresh;
    });
    _currentPage = 1;
    _hasNextPage = true;
    _isScroll = false;
    _dataList.clear();
    widget.onDataRequest(_currentPage, widget.pageSize, this);
  }

  void _loadMoreData() {
    _hasNextPage = true;
    widget.onDataRequest(_currentPage, widget.pageSize, this);
  }

  void showData(List<T> data) {
    if (data == null || data.isEmpty || data.length < widget.pageSize) {
      _hasNextPage = false;
    }
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
      if (data != null) {
        _dataList.addAll(data);
        _viewStatus = _ViewStatus.showData;
        _currentPage++;
      }
    });
  }

  void showError(String errorMessage) {
    _hasNextPage = false;
    setState(() {
      //_errorMessage = errorMessage;
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
