import 'dart:ui';

import 'package:flutter/material.dart';

class dietModel {
  String name;
  String image_path;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelected;

  dietModel(
      {required this.name,
      required this.image_path,
      required this.level,
      required this.duration,
      required this.calorie,
      required this.boxColor,
      required this.viewIsSelected});

  static List<dietModel> getDiet_fromHandWrite() {
    return <dietModel>[
      dietModel(
          name: "Keto Diet",
          image_path:
              "https://th.bing.com/th?id=OIP.plN1OWIkI9w5kqGCso6Z-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
          level: "Hard",
          duration: "1 Month",
          calorie: "2000",
          boxColor: Colors.blue,
          viewIsSelected: false),
      dietModel(
          name: "Vegan Diet",
          image_path:
              "https://th.bing.com/th?id=OIP.plN1OWIkI9w5kqGCso6Z-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
          level: "Easy",
          duration: "1 Month",
          calorie: "2000",
          boxColor: Colors.pink,
          viewIsSelected: false),
      dietModel(
          name: "Vegetarian Diet",
          image_path:
              "https://th.bing.com/th?id=OIP.plN1OWIkI9w5kqGCso6Z-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
          level: "Medium",
          duration: "1 Month",
          calorie: "2000",
          boxColor: Colors.blue,
          viewIsSelected: false),
      dietModel(
          name: "Atkins Diet",
          image_path:
              "https://th.bing.com/th?id=OIP.plN1OWIkI9w5kqGCso6Z-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
          level: "Hard",
          duration: "1 Month",
          calorie: "2000",
          boxColor: Colors.pink,
          viewIsSelected: false),
      dietModel(
          name: "Mediterranean Diet",
          image_path:
              "https://th.bing.com/th?id=OIP.plN1OWIkI9w5kqGCso6Z-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
          level: "Easy",
          duration: "1 Month",
          calorie: "2000",
          boxColor: Colors.blue,
          viewIsSelected: false),
    ];
  }
}



