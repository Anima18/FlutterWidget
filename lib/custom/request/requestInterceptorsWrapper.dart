import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'loadingDialog.dart';

class RequestInterceptorsWrapper extends InterceptorsWrapper {
  BuildContext context;
  String loadingMessage;
  CancelToken token;

  ProgressDialog loadingDialog;

  RequestInterceptorsWrapper(this.context, this.loadingMessage, this.token) {
    if (loadingMessage != null) {
      loadingDialog = new ProgressDialog(loadingMessage, onCancel:() {
        token.cancel("你取消了请求!");
        loadingDialog = null;
      });
    }
  }

  @override
  Future onRequest(RequestOptions options) {
    showLoading();
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    /*if (int.parse(response.headers.value(Headers.contentLengthHeader)) == -1) {
      hideLoading();
    }*/
    hideLoading();
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) async{
    print("========onError=========");
    hideLoading();
    return handleError(err);
  }
/*

  @override
  onRequest(RequestOptions options) {
    // 在请求被发送之前做一些事情
    print("========onRequest=========");
    showLoading();
    return options; //continue
  }

  @override
  onError(DioError err) {
    if (!CancelToken.isCancel(err)) {
      hideLoading();
    }
    print("========onError=========");
    hideLoading();
    //handle error action
    return handleError(err);
  }

  @override
  onResponse(Response response) {
    print("========onResponse=========");
    //下载上传文件请求在响应完成不关闭进度框
    if (response.headers.contentLength == -1) {
      hideLoading();
    }
    return response; // continue
  }
*/


  void showLoading() {
    if (loadingDialog != null) {
      print("========showLoading=========");
      loadingDialog.show(context);
    }
  }

  void hideLoading() {
    if (loadingDialog != null) {
      print("========hideLoading=========");
      loadingDialog.hide(context);
      loadingDialog = null;
    }
  }

  void updateLoadingProgress(String progress) async {
    if (loadingDialog != null) {
      print("========updateLoadingProgress=========");
      await loadingDialog.updateProgress(progress);
    }
  }


  DioError handleError(DioError err) {
    DioErrorType type = err.type;
    if (type == DioErrorType.CONNECT_TIMEOUT ||
        type == DioErrorType.RECEIVE_TIMEOUT) {
      err.error = "请求服务超时!";
    } else if (type == DioErrorType.RESPONSE) {
      int statusCode = err.response.statusCode;
      if (statusCode >= 300 && statusCode < 400) {
        err.error = "请求重定向";
      } else if (statusCode >= 400 && statusCode < 500) {
        err.error = "请求包含语法错误或者请求无法实现";
      } else if (statusCode >= 500 && statusCode < 600) {
        err.error = "服务器遇到错误，无法完成请求";
      }
    } else if (type == DioErrorType.CANCEL) {
      err.error = "你取消了请求!";
    } else if (type == DioErrorType.DEFAULT) {
      if (err.message.contains("FormatException")) {
        err.error = "请求URL格式不正确!";
      } else if (err.message.contains("Connection failed") || err.message.contains("Connection refused")) {
        err.error = "连接服务器失败,请检查网络或服务器是否开启";
      } else if(err.message.contains("No such file or directory")) {
        err.error = "上传的文件不存在";
      }
    }
    return err;
  }

}
