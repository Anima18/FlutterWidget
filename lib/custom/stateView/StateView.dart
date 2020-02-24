
import 'package:flutter/material.dart';

typedef OnRetry = void Function();

class StateView extends StatelessWidget {

  Widget _loadingView;
  Widget _errorView;
  Widget _emptyView;
  Widget _child;
  OnRetry _onRetry;
  ViewStatus _viewStatus;
  String _errorMessage;


  StateView({Widget loadingView, Widget errorView, Widget emptyView, Widget child,
    OnRetry onRetry, ViewStatus viewStatus, String errorMessage}){
    this._errorMessage = errorMessage == null ? "" : errorMessage;
    this._loadingView  = loadingView == null ? _getLoadingView() : loadingView;
    this._errorView  = errorView == null ? _getErrorView() : errorView;
    this._emptyView  = emptyView == null ? _getEmptyView() : emptyView;
    this._child  = child;
    this._onRetry = onRetry;
    this._viewStatus = viewStatus;
  }

  @override
  Widget build(BuildContext context) {
    if (_viewStatus == ViewStatus.loading) {
      return _loadingView;
    } else if (_viewStatus == ViewStatus.error) {
      return _errorView;
    } else if (_viewStatus == ViewStatus.empty) {
      return _emptyView;
    }else {
      return _child;
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
              Image.asset("icons/list_request_error.png", width: 88, height: 88,),
              SizedBox(height: 16,),
              Text(_errorMessage, style: TextStyle(fontSize: 16, color: Colors.black54),),
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
            Image.asset("icons/list_request_no_data.png", width: 88, height: 88,),
            SizedBox(height: 16,),
            Text("没有数据", style: TextStyle(fontSize: 16, color: Colors.black54),),
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
    if(_onRetry != null) {
      _onRetry();
    }
  }

}

enum ViewStatus {
  loading,
  error,
  empty,
  content
}
/*

class ViewState extends State {

  _ViewStatus _viewState;
  OnRetry _onRetry;
  Widget _loadingView;
  Widget _errorView;
  Widget _emptyView;
  Widget _contentView;
  String _errorMessage = "";


  ViewState(OnRetry onRetry, Widget loadingView, Widget errorView, Widget emptyView,
      Widget contentView) {
    this._loadingView  = loadingView == null ? _getLoadingView() : loadingView;
    this._errorView  = errorView == null ? _getErrorView() : errorView;
    this._emptyView  = emptyView == null ? _getEmptyView() : emptyView;
    this._contentView  = contentView;
    this._onRetry = onRetry;
  }

  @override
  void initState() {
    super.initState();
    _viewState = _ViewStatus.loading;
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
              Image.asset("icons/list_request_error.png", width: 88, height: 88,),
              SizedBox(height: 16,),
              Text(_errorMessage, style: TextStyle(fontSize: 16, color: Colors.black54),),
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
            Image.asset("icons/list_request_no_data.png", width: 88, height: 88,),
            SizedBox(height: 16,),
            Text("没有数据", style: TextStyle(fontSize: 16, color: Colors.black54),),
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

  @override
  Widget build(BuildContext context) {
    if (_viewState == _ViewStatus.loading) {
      return _loadingView;
    } else if (_viewState == _ViewStatus.error) {
      return _errorView;
    } else if (_viewState == _ViewStatus.empty) {
      return _emptyView;
    }else {
      return _contentView;
    }
  }

  void _retry() {
    if(_onRetry != null) {
      _onRetry();
    }
  }

  void showLoading() {
    setState(() {
      _viewState = _ViewStatus.loading;
    });
  }

  void showError() {
    setState(() {
      _viewState = _ViewStatus.error;
    });
  }

  void showEmpty() {
    setState(() {
      _viewState = _ViewStatus.empty;
    });
  }

  void showContent() {
    setState(() {
      _viewState = _ViewStatus.content;
    });
  }
}*/
