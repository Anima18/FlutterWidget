import 'package:flutter/material.dart';

typedef void OnCancel();

class ProgressDialog extends Dialog {
  String message;
  OnCancel onCancel;
  bool isCancel;
  LoadingProgressWidget loadingProgressWidget;

  ProgressDialog(this.message, {this.isCancel = false, this.onCancel});

  @override
  Widget build(BuildContext context) {
    loadingProgressWidget = LoadingProgressWidget(message);
    return WillPopScope(
      onWillPop: () {
        onCancel();
        return Future.value(true);
      },// 拦截Android返回键
      child: GestureDetector(
        onTap: () {
          if(isCancel) {
            Navigator.pop(context);
            if(onCancel != null) {
              onCancel();
            }
          }
        },
        child: Container(
          padding: EdgeInsets.all(36),// 外边距
          color: Colors.transparent,// 必须设置颜色之后外层GestureDetector的onTap才会回调
          child: GestureDetector(
            onTap: () {},// 点击Dialog不响应外部点击关闭事件
            child: Center(
              child: Material(
                color: Colors.white,// 背景
                borderRadius: BorderRadius.circular(6),// 倒角
                child: Padding(
                  padding: EdgeInsets.fromLTRB(24, 24, 24, 24),// 内边距
                  child: loadingProgressWidget,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void updateProgress(String progress) {
    this.message = progress;
    if(loadingProgressWidget != null) {
      loadingProgressWidget.updateProgress(message);
    }
  }

  void show(BuildContext context) {
    showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return this;
        });
  }

  void hide(BuildContext context) {
    try {
      Navigator.of(context,rootNavigator: true).pop(true);
    } on Error catch(e) {
      print(e);
    }

  }
}

class LoadingProgressWidget extends StatefulWidget {

  ProgressState state;

  LoadingProgressWidget(String message) {
    state = new ProgressState(message);
  }

  @override
  ProgressState createState() {
    return state;
  }

  void updateProgress(String progress) {
    state.setState(() {
      state.message = progress;
    });
  }
}

class ProgressState extends State<LoadingProgressWidget> {

  String message;


  ProgressState(this.message);

  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ]);
  }
}
