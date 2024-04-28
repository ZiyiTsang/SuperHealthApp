import 'dart:ui';

import 'package:flutter/material.dart';
class PopularDietModel {
  String name;
  String image_paht;
  String level;
  String duration;
  String calorie;

  PopularDietModel({
    required this.name,
    required this.image_paht,
    required this.level,
    required this.duration,
    required this.calorie,
  });

  static List<PopularDietModel> getPopularDiet_fromHandWrite(){
    return <PopularDietModel>[
      PopularDietModel(
        name: "Keto Diet",
        image_paht: "https://th.bing.com/th?id=OIP.plN1OWIkI9w5kqGCso6Z-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
        level: "Hard",
        duration: "1 Month",
        calorie: "2000",
      ),
      PopularDietModel(
        name: "Vegan Diet",
        image_paht: "https://th.bing.com/th?id=OIP.plN1OWIkI9w5kqGCso6Z-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
        level: "Easy",
        duration: "1 Month",
        calorie: "2000",
      ),
      PopularDietModel(
        name: "Vegetarian Diet",
        image_paht: "https://th.bing.com/th?id=OIP.plN1OWIkI9w5kqGCso6Z-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
        level: "Medium",
        duration: "1 Month",
        calorie: "2000",
      ),
      PopularDietModel(
        name: "Atkins Diet",
        image_paht: "https://th.bing.com/th?id=OIP.plN1OWIkI9w5kqGCso6Z-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
        level: "Hard",
        duration: "1 Month",
        calorie: "2000",
      ),
    ];
  }
}