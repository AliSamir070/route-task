import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../utils/constants.dart';

class ApiManager{
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: Constants.baseUrl,
        receiveDataWhenStatusError: true,
        receiveTimeout: const Duration(milliseconds: 30000),
        sendTimeout: const Duration(milliseconds: 30000),
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        }));
    dio?.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ));
  }
  static Future<Response>? GetRequest({required String endpoint , Map<String , dynamic>? data ,Map<String , dynamic>? headers }){
    return dio?.get(endpoint,queryParameters: data,options: Options(
      headers: headers
    ));
  }
  static Future<Response>? PostRequest({required String endpoint , Map<String , dynamic>? data}){
    return dio?.post(endpoint,data: data);
  }
  static Future<Response>? DeleteRequest({required String endpoint , Map<String , dynamic>? data}){
    return dio?.delete(endpoint,data: data);
  }
  static Future<Response>? PutRequest({required String endpoint , Map<String , dynamic>? data}){
    return dio?.put(endpoint,data: data);
  }
}