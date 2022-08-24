import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:la_vie/shared/constants/access_token.dart';

class DioHelper {
  static Dio dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://lavie.orangedigitalcenteregypt.com/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    @required String url,
    Map<String, dynamic> query,
    String lang = 'en',
    String token,
  }) async
  {
    dio.options.headers =
    {
      'Content-Type': 'application/json',
       'Accept': 'application/json',
      'Authorization': 'Bearer ${accessToken}'
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    String url,
     Map<String, dynamic> data,
    Map<String, dynamic> query,
  }) async
  {
    dio.options.headers =
    {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${accessToken}'

    };

    return dio.post(
      url,
      queryParameters: query,
      data: data,
    ).catchError((error) {
      print('error in Post Data Dio ${error.toString()}');
    });
  }

  static Future<Response> putData({
    @required String url,
    @required Map<String, dynamic> data,
    Map<String, dynamic> query,
    String lang = 'en',
    String token,
  }) async
  {
    dio.options.headers =
    {

    };

    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> patchData({
     String url,
    Map<String , dynamic> query,
     Map<String , dynamic> data,
    String token ,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${accessToken}',
    };
  }
}