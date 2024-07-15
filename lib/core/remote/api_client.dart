import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'api_constant.dart';
import 'api_exception.dart';

class ApiClient {
  late Dio dio;
  late BaseOptions baseOptions;
  ApiClient() {
    baseOptions = BaseOptions(baseUrl: ApiConstant.mainUrl);
    dio = Dio(baseOptions);
  }

  //=========================GET==============================\\

  Future<Response> getRequest({
    required String path,
    String token = "",
  }) async {
    final options = Options(headers: {
      "auth-token": token,
    });

    try {
      debugPrint("🚀===============API REQUEST===============🚀");
      debugPrint("Request URL: ${baseOptions.baseUrl}");
      var response = await dio.get(path, options: options);
      debugPrint("👻==============API RESPONSE==============👻");
      debugPrint("Status Code: ${response.statusCode}");
      log("DATA: ${response.data}");
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(
          e.response!.data.toString(),
        );
        debugPrint(
          e.response!.headers.toString(),
        );
        debugPrint(
          e.response!.requestOptions.toString(),
        );
        throw ApiException(
          message: e.response!.statusMessage,
        );
      } else {
        debugPrint(
          e.requestOptions.toString(),
        );
        debugPrint(e.message);
        throw ApiException(message: e.message);
      }
    }
  }

  //=========================POST==============================\\

  Future<Response> postRequest({
    required String path,
    dynamic body,
    String token = "",
  }) async {
    final options = Options(headers: {
      "auth-token": token,
    });

    try {
      debugPrint("🚀===============API REQUEST===============🚀");
      debugPrint("Request URL: ${baseOptions.baseUrl + path}");
      debugPrint("Body $body");

      var response = await dio.post(path, data: body, options: options);
      debugPrint("👻==============API RESPONSE==============👻");
      debugPrint("Status Code: ${response.statusCode}");
      log("DATA: ${response.data}");
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(
          e.response!.data.toString(),
        );
        debugPrint(
          e.response!.headers.toString(),
        );
        debugPrint(
          e.response!.requestOptions.toString(),
        );
        throw ApiException(
          message: e.response!.statusMessage,
        );
      } else {
        debugPrint(
          e.requestOptions.toString(),
        );
        debugPrint(e.message);
        throw ApiException(message: e.message);
      }
    }
  }
//=========================PUT==============================\\

  Future<Response> updateRequest({
    required String path,
    dynamic body,
    String token = "",
  }) async {
    final options = Options(headers: {
      "auth-token": token,
    });

    try {
      debugPrint("🚀===============API REQUEST===============🚀");
      debugPrint("Request URL: ${baseOptions.baseUrl + path}");
      debugPrint("Body $body");

      var response = await dio.put(path, data: body, options: options);
      debugPrint("👻==============API RESPONSE==============👻");
      debugPrint("Status Code: ${response.statusCode}");
      log("DATA: ${response.data}");
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(
          e.response!.data.toString(),
        );
        debugPrint(
          e.response!.headers.toString(),
        );
        debugPrint(
          e.response!.requestOptions.toString(),
        );
        throw ApiException(
          message: e.response!.statusMessage,
        );
      } else {
        debugPrint(
          e.requestOptions.toString(),
        );
        debugPrint(e.message);
        throw ApiException(message: e.message);
      }
    }
  }

  Future<Response> deleteRequest({
    required String path,
    String token = "",
  }) async {
    final options = Options(headers: {"auth-token": token});

    try {
      debugPrint("🚀===============API REQUEST===============🚀");
      debugPrint("Request URL: ${dio.options.baseUrl + path}");

      var response = await dio.delete(
        path,
        options: options,
      );
      debugPrint("👻==============API RESPONSE==============👻");
      debugPrint("Status Code: ${response.statusCode}");
      debugPrint("DATA: ${response.data}");
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response!.data.toString());
        debugPrint(e.response!.headers.toString());
        debugPrint(e.response!.requestOptions.toString());
        throw ApiException(message: e.response!.statusMessage);
      } else {
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
        throw ApiException(message: e.message);
      }
    }
  }
}
