import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:third/Model/Request/LoginRequest.dart';
import 'package:third/Utils/SharePref.dart';

class NetworkUtils {
  static NetworkUtils? _instance;
  static Dio? dio;
  late String baseUrl = '';

  NetworkUtils._internal() {
    Future<String> jsonData = loadJsonData();
    dio = Dio();
    jsonData.then((value) {
      var data = jsonDecode(value);
      baseUrl = data['network_ip'];
      dio!.options.connectTimeout = Duration(seconds: 5);
      dio!.options.receiveTimeout = Duration(seconds: 3);
      dio!.interceptors.add(CustomInterceptors());
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
      await dio!.get(baseUrl);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login(String username, String password) async {
    Map<String, dynamic> loginRequest =
        LoginRequest(loginId: username, password: password).toJson();
    try {
      Response response = await dio!
          .post(baseUrl + '/v1/auth/login/using-password', data: loginRequest);
      SharedPreferencesHelper().setToken(response.data['token']);
      //reset_interceptor();
    } catch (e) {
      return false;
    }
    return true;
  }

  void reset_interceptor() {
    print("reset");
    dio!.interceptors.remove(CustomInterceptors());
    dio!.interceptors.add(CustomInterceptors());
  }
}

class CustomInterceptors extends Interceptor {
  String token = '';

  CustomInterceptors() {
    String? tmp = SharedPreferencesHelper().getToken();
    if (tmp == null) {
      tmp = '';
    } else {
      if (tmp.isNotEmpty) {
        token = tmp;
      } else {
        print("EMPTY tmp");
      }
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var total_token = "";
    if (token != "") {
      total_token = "Bearer $token";
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
