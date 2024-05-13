import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:third/Model/Respone/NewsRespnose.dart';

import '../Model/Article.dart';
import 'Func.dart';

class NetworkUtilsNews {
  static NetworkUtilsNews? _instance;
  static Dio? dio;
  late String baseUrl = '';
  late String token = '';
  late List<List<Article>> news_chunk = [];

  NetworkUtilsNews._internal() {
    dio = Dio();
    Future<String> jsonData = loadJsonData();
    jsonData.then((value) {
      var data = jsonDecode(value);
      baseUrl = data['news_endpoint'];
      token = data['news_token'];
      dio!.options.connectTimeout = Duration(seconds: 10);
      dio!.options.receiveTimeout = Duration(seconds: 8);
      dio!.interceptors.add(CustomInterceptors(token: token));
    });
  }

  Future<String> loadJsonData() async {
    // 加载JSON文件内容
    String jsonData = await rootBundle.loadString('assets/File/Secret.json');
    return jsonData;
  }

  factory NetworkUtilsNews() {
    if (_instance == null) {
      _instance = NetworkUtilsNews._internal();
    }
    return _instance!;
  }

  Future<List<dynamic>> get_news(String query, chunk_num) async {
    if (query == "") {
      return [false, []];
    }
    if (news_chunk.length == 0) {
      try {
        var response = await dio!.get(baseUrl + "?q=" + query);
        if (response.statusCode != 200) {
          return [false, []];
        } else {
          // this is to check if the json is correct
          List<Article>? a =
              NewsResponse.fromJson(response.data).articles == null
                  ? []
                  : NewsResponse.fromJson(response.data).articles;
          if (a?.length == 0) {
            return [false, []];
          }
          news_chunk = chunk(a!.cast<Article>(), 10);
        }
      } catch (e) {
        print(e);
        return [false, []];
      }
    }
    if (chunk_num >= news_chunk.length) {
      chunk_num = 0;
    }
    print(news_chunk[chunk_num].length);
    removeArticlesWithNullFields(news_chunk[chunk_num]);
    print(news_chunk[chunk_num].length);
    return [true, news_chunk[chunk_num]];
  }
}

class CustomInterceptors extends Interceptor {
  late String token;

  CustomInterceptors({required this.token});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (token != "") {
      var total_token = "Bearer $token";
      options.headers['Authorization'] = total_token;
    }

    print(
        'REQUEST[${options.method}] => PATH: ${options.path} DATA: ${options.data} AUTH: ${options.headers['Authorization']}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('RESPONSE[${response.statusCode}] => Data: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    print('ERROR[${err.response?.statusCode}]');
    super.onError(err, handler);
  }
}

List<List<T>> chunk<T>(List<T> list, int size) {
  return List.generate((list.length / size).ceil(), (int index) {
    int start = index * size;
    return list.skip(start).take(size).toList();
  });
}
