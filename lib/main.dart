import 'package:flutter/cupertino.dart';
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
  runApp(
     MaterialApp(
        title: 'Ziyi App' ,
        theme: ThemeData(useMaterial3: true,textTheme: GoogleFonts.robotoSlabTextTheme(),),
         home: SplashScreen(key: Key('splash')),
         // home: mainScreen(),
        routes: {
          '/home': (context) => mainScreen(),
          '/lottie': (context) => SplashScreen(key: Key('splash')),
          '/login': (context) => LoginPage(),
          '/signup': (context) => SignupPage(),
          "/default_login": (context) => DefaultLogin(),

        }
    )
  );
}

