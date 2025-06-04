import 'dart:developer';
import 'package:dio/dio.dart';

class DioClient {
  Dio dioClient = Dio(
      BaseOptions(
        baseUrl: "http://api.elaro.uz/api",
        receiveTimeout: Duration(minutes: 1),
        connectTimeout: Duration(minutes: 1),
      ),
    )
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (option, handler) {
          log("Method type: ${option.method}");
          log("Method type: ${option.path}");
          log("Request data: ${option.data}");
          return handler.next(option);
        },
        onResponse: (option, handler) {
          log("response status code: ${option.statusCode}");
          log("response data: ${option.data}");
          return handler.next(option);
        },
        onError: (e, handler) {
          log("Error: $e");
          return handler.next(e);
        },
      ),
    );
}
