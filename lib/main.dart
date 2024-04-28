import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third/PageSturcture/mainscreen.dart';

import 'Utils/sharePref.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
     MaterialApp(
        title: 'Ziyi App' ,
        theme: ThemeData(useMaterial3: true,textTheme: GoogleFonts.robotoSlabTextTheme(),),
        home: mainScreen(),
        routes: {
          '/home': (context) => mainScreen(),
        }
    )
  );
}

