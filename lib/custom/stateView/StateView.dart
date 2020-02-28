import 'package:flutter/material.dart';

typedef OnRetry = void Function();

class StateView extends StatelessWidget {
  Widget _loadingView;
  Widget _errorView;
  Widget _emptyView;
  final Widget child;
  final OnRetry onRetry;
  final ViewStatus viewStatus;
  final String errorMessage;

  StateView(
      {@required this.child,
      this.onRetry,
      @required this.viewStatus,
      @required this.errorMessage,
      Widget loadingView,
      Widget errorView,
      Widget emptyView}) {
    _loadingView  = loadingView == null ? _getLoadingView() : loadingView;
    _errorView  = errorView == null ? _getErrorView() : errorView;
    _emptyView  = emptyView == null ? _getEmptyView() : emptyView;
  }


  @override
  Widget build(BuildContext context) {
    if (viewStatus == ViewStatus.loading) {
      return _loadingView;
    } else if (viewStatus == ViewStatus.error) {
      return _errorView;
    } else if (viewStatus == ViewStatus.empty) {
      return _emptyView;
    } else {
      return child;
    }
  }

  Widget _getLoadingView() {
    return Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }

  Widget _getErrorView() {
    return Container(
      alignment: Alignment.center,
      child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "icons/list_request_error.png",
                width: 88,
                height: 88,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                errorMessage,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              FlatButton(
                child: Text("点击重试"),
                textColor: Colors.blue,
                onPressed: () {
                  _retry();
                },
              ),
            ],
          )),
    );
  }

  Widget _getEmptyView() {
    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "icons/list_request_no_data.png",
              width: 88,
              height: 88,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "没有数据",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            FlatButton(
              child: Text("点击重试"),
              textColor: Colors.blue,
              onPressed: () {
                _retry();
              },
            ),
          ],
        ));
  }

  void _retry() {
    if (onRetry != null) {
      onRetry();
    }
  }
}

enum ViewStatus { loading, error, empty, content }
