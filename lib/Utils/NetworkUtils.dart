import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class NetworkUtils {
  static NetworkUtils? _instance;
  static Dio? dio;
  late String baseUrl = '';

  NetworkUtils._internal(){
    Future<String> jsonData = loadJsonData();
    dio = Dio();
    jsonData.then((value) {
      var data = jsonDecode(value);
      baseUrl = data['network_ip'];
      dio!.options.connectTimeout = Duration(seconds: 5);
      dio!.options.receiveTimeout = Duration(seconds: 3);
    });
  }

  Future<String> loadJsonData() async {
    // 加载JSON文件内容
    String jsonData = await rootBundle.loadString('assets/File/Secret.json');
    return jsonData;
  }

  factory NetworkUtils() {
    if (_instance == null) {
      _instance = NetworkUtils._internal();
    }
    return _instance!;
  }

  Future<bool> try_network() async {
    try {
      print(baseUrl);
      await dio!.get(baseUrl);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}