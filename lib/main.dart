import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third/Page/Login/Signup.dart';
import 'package:third/PageSturcture/mainscreen.dart';

import 'Page/Login/Default_Login.dart';
import 'Page/Login/Login.dart';
import 'PageSturcture/lottie.dart';
import 'Utils/SharePref.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesHelper(); //初始化SharePref，bug等到assg2再修吧

  runApp(
     MaterialApp(
    title: 'Ziyi App ',
    //Assg 2的时候试试有啥用
    theme: ThemeData(useMaterial3: true,textTheme: GoogleFonts.robotoSlabTextTheme(),),
         home: SplashScreen(key: Key('splash')),
    debugShowCheckedModeBanner: false,
    // 去掉debug图标
    // home: mainScreen(),
        routes: _routes,
    )
  );
}
Map<String,WidgetBuilder> _routes = {
  '/home': (context) => mainScreen(),
  '/lottie': (context) => SplashScreen(key: Key('splash')),
  '/login': (context) => LoginPage(),
  '/signup': (context) => SignupPage(),
  "/default_login": (context) => DefaultLogin(),
};

