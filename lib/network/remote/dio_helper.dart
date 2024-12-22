import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/', 
        receiveDataWhenStatusError: true,
        ));
  }

 static Future <Response>getData({
    required String url,
    required Map<String, dynamic> query
  }) async{
    return await dio!.get(url,queryParameters: query);
  }
  
  Future<void> fetchNewsData(String url, Map<String, dynamic> query) async {
    try {
      var response = await DioHelper.getData(url: url, query: query);
      if (kDebugMode) {
        print(response.data['totalResults']);
      } // Assuming this is the correct key
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }
}

