import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import '../Model/User_info.dart';

class SharedPreferencesHelper {
  static SharedPreferencesHelper? _instance;
  SharedPreferencesHelper._internal(){
    _initSharedPreferences();

  }
  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }
  late SharedPreferences _prefs;

  factory SharedPreferencesHelper() {
    if (_instance == null) {
      _instance = SharedPreferencesHelper._internal();
    }
    return _instance!;
  }


  Future<User_info> getCurrentUserInfo() async {
    return User_info(
      name: _prefs.getString('name'),
      email: _prefs.getString('email'),
      password_hash: _prefs.getString('password_hash'),
      phone: _prefs.getString('phone'),
    );
  }
  bool get isLogin => _prefs.getBool('isLogin') ?? false;
  void setLogin(bool value) {
    _prefs.setBool('isLogin', value);
  }
  bool setCurrentUserInfo(User_info user) {
    _prefs.setString('name', user.name!);
    _prefs.setString('email', user.email!);
    _prefs.setString('password_hash', user.password_hash!);
    _prefs.setString('phone', user.phone!);
    _prefs.setBool('isLogin', false);
    return true;
  }
  void clearUser() {
    _prefs.remove('name');
    _prefs.remove('email');
    _prefs.remove('password_hash');
    _prefs.remove('phone');
    _prefs.remove('isLogin');
    _prefs.remove('token');
  }
  void clearEverything(){
    _prefs.clear();
  }
  void setToken(String token){
    print("Set token:$token");
    _prefs.setString('token', token);
  }
  String? getToken(){
    String? token=_prefs.getString('token');
    print("get token:$token");
    return token;
  }
}
