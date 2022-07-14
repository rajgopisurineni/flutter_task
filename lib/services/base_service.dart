import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_task/services/urls.dart';
import 'package:flutter_task/utils/constants.dart';
import 'package:flutter_task/utils/models.dart';
import 'package:provider/provider.dart';

import '../utils/global_variable.dart';


class BaseService {
  /// Method to make request
  Future<dynamic> makeRequest<T>(String url,{
    dynamic body,
    Options? options,
    Map<String, dynamic>? queryParameters,
    RequestType? method = RequestType.GET,
    Map<String, dynamic>? headers
  }) async {
    dio.options.baseUrl = '';
    dio.options.connectTimeout = Constants.CONNECTION_TIMEOUT; //5s
    dio.options.receiveTimeout = Constants.RECEIVE_TIMEOUT; //5s
    dio.options.contentType = 'application/json';
    dio.options.headers = {
    "Content-Type" : "application/json"
    };

    Response response;
    switch (method) {
      case RequestType.GET:
          response = await dio.get(url, queryParameters: queryParameters);
          return response.data;
      case RequestType.PUT:
        response =
        await dio.put(url, options: options, data: json.encode(body));
        return response.data;
      case RequestType.POST:
        response =
        await dio.post(url, options: options, queryParameters: queryParameters,
            data: body is FormData ? body : json.encode(body));
        return response.data;
      case RequestType.DELETE:
        response =
        await dio.delete(url, options: options,
            queryParameters: queryParameters, data: json.encode(body));
        return response.data;
    }
  }
}
