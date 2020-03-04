import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../entity_factory.dart';
import 'requestInterceptorsWrapper.dart';

typedef void OnSuccess<T>(T data);
typedef void OnError(String message);

class NetworkRequest<T> {
  final BuildContext context;
  Dio _dio;
  RequestInterceptorsWrapper _requestInterceptors;

  //请求地址
  final String url;
  //请求提示信息
  final String message;
  //请求参数
  final Map<String, dynamic> parameters;
  //文件保存地址
  final String saveFilePath;
  //请求头
  Map<String, String> requestHeaders;
  //文件上传数据
  final List<String> uploadFiles;

  CancelToken _token;

  NetworkRequest(this.url, {this.context, this.message, this.parameters, this.requestHeaders, this.saveFilePath, this.uploadFiles}) {
    _token = new CancelToken();
    _initRequestHeaders();

    _requestInterceptors = new RequestInterceptorsWrapper(context, message, _token);
    _dio = new Dio(_getRequestOptions());
    _dio.interceptors.add(_requestInterceptors);
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client){
      client.findProxy = (uri){
        return "PROXY 192.168.60.177:8888";
      };
    };
  }

  void _initRequestHeaders() {
    if(this.requestHeaders == null) {
      requestHeaders = Map();
    }
    /*requestHeaders.addAll(
        {
          "Cookie":"JSESSIONID=DC08A331D8F83BFCE4FD806D3D4A9413",
          "user-agent": "android"
        });*/
  }

  Future<T> get({OnSuccess<T> onSuccess, OnError onError}) async {
    T data;
    try {
      Response<Map<String, dynamic>> response = await _dio.get(url, cancelToken: _token, queryParameters: parameters);
      data = EntityFactory.generateOBJ(response.data);
      if(onSuccess != null) {
        onSuccess(data);
      }
    } on DioError catch (e) {
      if(onError != null) {
        onError(e.message);
      }
    }
    return Future<T>(()=>data);
  }

  Future<T> post({OnSuccess<T> onSuccess, OnError onError}) async {
    T data;
    try {
      Response<Map<String, dynamic>> response = await _dio.post(url, cancelToken: _token, queryParameters: parameters);

      data = EntityFactory.generateOBJ(response.data);
      if(onSuccess != null) {
        onSuccess(data);
      }
    } on DioError catch (e) {
      if(onError != null) {
        onError(e.message);
      }
    }
    return Future<T>(()=>data);
  }

  Future<String> download({OnSuccess<String> onSuccess, OnError onError}) async {
    String data;
    try {
      await _dio.download(
          url,
          saveFilePath,
          cancelToken: _token,
          onReceiveProgress: (int count, int total) {
            int progress = count * 100 ~/ total;
            if (progress % 2 == 0) {
              _requestInterceptors.updateLoadingProgress("$progress%");
            }
            if (progress == 100) {
              _requestInterceptors.hideLoading();
            }
          },
        );

      if(onSuccess != null) {
        onSuccess(saveFilePath);
      }
      data = saveFilePath;
    } on DioError catch (e) {
      _requestInterceptors.hideLoading();
      String errorMessage = _requestInterceptors.handleError(e).error.toString();
      if(onError != null) {
        onError(errorMessage);
      }
    }
    return Future<String>(()=>data);
  }

  Future<T> upload({OnSuccess<T> onSuccess, OnError onError}) async {
    T data;
    try {
      FormData formData = FormData();
      for(String filePath in uploadFiles) {
        //File file = new File(filePath);
        String fileName = filePath.substring(filePath.lastIndexOf("/")+1);
        var mapEntry = MapEntry(
          "files[]",
          await MultipartFile.fromFile(filePath,
              filename: fileName),
        );

        formData.files.add(mapEntry);
      }

      Response<Map<String, dynamic>> response = await _dio.post(url,
          cancelToken: _token,
          data: formData,
          onSendProgress: (int sent, int total) {
            int progress = sent * 100 ~/ total;
            if (progress % 2 == 0) {
              _requestInterceptors.updateLoadingProgress("$progress%");
            }
            if (progress == 100) {
              _requestInterceptors.hideLoading();
            }
          });

      data = EntityFactory.generateOBJ(response.data);
      if(onSuccess != null) {
        onSuccess(data);
      }
    } on DioError catch (e) {
      _requestInterceptors.hideLoading();
      String errorMessage = _requestInterceptors.handleError(e).error.toString();
      if(onError != null) {
        onError(errorMessage);
      }
    }
    return Future<T>(()=>data);
  }


  BaseOptions _getRequestOptions() {
    return new BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 10000,
      headers: requestHeaders,
    );
  }
}

