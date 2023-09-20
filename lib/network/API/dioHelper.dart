// ignore_for_file: file_names

import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json'}));
  }

  // static Future<Response> postData({
  //   required String url,
  //   Map<String, dynamic>? query,
  //   required Map<String, dynamic> data,
  //   String? token,
  //   String lang = 'en',
  // }) async {
  //   dio.options.headers = {
  //     'Content-Type': 'application/json',
  //     'lang': lang,
  //     'Authorization': token,
  //   };
  //   return dio.post(url, data: data);
  // }

  static Future<Response> getDate(
      {String url = 'v2/top-headlines',
       String? category,
       String? search,
      Map<String, dynamic>? query,
      String country = 'eg',
      String token = '65f7f556ec76449fa7dc7c0069f040ca'}) async {
    query = {
      'category': category,
      'country': country,
      'q': search,
      'apiKey': token,
    };
    return await dio.get(url, queryParameters: query);
  }

  // static Future<Response> putData({
  //   required String url,
  //   Map<String, dynamic>? query,
  //   required Map<String, dynamic> data,
  //   String? token,
  //   String lang = 'en',
  // }) async {
  //   dio.options.headers = {
  //     'Content-Type': 'application/json',
  //     'lang': lang,
  //     'Authorization': token,
  //   };
  //   return dio.put(url, data: data);
  // }
}
