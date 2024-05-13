import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:third/PageSturcture/mainscreen.dart';

import '../Utils/NetworkUtils.dart';
import '../Utils/NetworkUtils_News.dart';
import '../Utils/SharePref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({required Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 89999),

    );
  }

  @override
  Widget build(BuildContext context) {
    NetworkUtils();
    NetworkUtilsNews();
    return Scaffold(
      body: Container(
      color: Colors.white,
      width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/File/Animation_2.json',
              controller: _controller,
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
              animate: true,
              repeat: true,
              onLoaded: (composition) {
                _controller
                  ..duration = composition.duration
                  ..forward().whenComplete(() => {
                    if (SharedPreferencesHelper().isLogin){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => mainScreen()),
                      )
                    }
                    else{
                      Navigator.pushReplacementNamed(context, '/default_login')
                    }
                  });
              },
            ),
          Text(
            'Loading..',
            style: GoogleFonts.robotoSlab(
              color: Colors.black,
              fontSize: 42,
            ),)
          ],
        ),
      )
    );
  }
}