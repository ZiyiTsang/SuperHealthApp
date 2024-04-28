import 'package:shared_preferences/shared_preferences.dart';

import '../Model/User_info.dart';

class SharedPreferencesHelper {
  SharedPreferencesHelper._privateConstructor(){
    _init();
  }

  static final SharedPreferencesHelper instance =
      SharedPreferencesHelper._privateConstructor();

  late SharedPreferences _prefs;

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
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
  }
  void clearEverything(){
    _prefs.clear();
  }
}
